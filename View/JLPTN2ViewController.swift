//
//  JLPTN2ViewController.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/22/25.
//

import UIKit

class JLPTN2ViewController: UIViewController {
    
    private var questions: [Question] = []
    private var currentIndex: Int = 0
    private var score: CGFloat = 0
    private var progress: CGFloat = 0
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var closeButton: UIButton!
    private var progressLabel: UILabel!
    private var questionLabel: UILabel!
    private var optionsStackView: UIStackView!
    private var nextButton: UIButton!
    private var imageView: UIImageView!
    private let level: String = "N2"
    private let quizGroup: String = "Group2" // 각 뷰에 대해 고유한 quizGroup 설정
    
    // 풀스크린 모드를 위한 오버라이드
    override var prefersStatusBarHidden: Bool {
        return true // 상태 표시줄 완전히 숨기기
    }
    
    // 뷰 컨트롤러 초기화 시 프레젠테이션 스타일 설정
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureFullScreenMode()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureFullScreenMode()
    }
    
    // 풀스크린 모드 설정 메서드
    private func configureFullScreenMode() {
        // 초기화 시 풀스크린 모드 설정
        self.modalPresentationStyle = .fullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupUI()
            
        // 다크모드 변경 감지를 위한 트레이트 변경 등록
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            if self.traitCollection.userInterfaceStyle != previousTraitCollection.userInterfaceStyle {
                self.updateUIForTheme()
            }
        }
        
        loadQuestions()
            
            // First load the progress, then display the question
        currentIndex = DatabaseManager.shared.loadProgress(level: level, quizGroup: quizGroup)

            // Make sure currentIndex is valid
            if currentIndex >= questions.count {
                currentIndex = 0 // Reset if saved progress is invalid
            }
            
            displayQuestion()
    }
    
    // 이미지 탭 처리를 위한 메서드 추가
    @objc private func imageTapped(_ gesture: UITapGestureRecognizer) {
        guard let tappedImageView = gesture.view as? UIImageView,
              let image = tappedImageView.image else { return }
        
        let fullscreenVC = FullscreenImageViewController(image: image)
        fullscreenVC.modalPresentationStyle = .fullScreen // 이미지 뷰 컨트롤러도 풀스크린으로 설정
        present(fullscreenVC, animated: true)
    }
    
    
    // 뷰가 나타날 때 호출되는 메서드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // iOS 13 이상에서 풀스크린 모드 강제 적용
        if #available(iOS 13.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.windows.first?.overrideUserInterfaceStyle = .light // 또는 .dark로 테마 강제 설정
            
            // 상태바 숨기기
            if let statusBarManager = windowScene?.statusBarManager {
                if statusBarManager.isStatusBarHidden == false {
                    setNeedsStatusBarAppearanceUpdate()
                }
            }
        }
        
        // 안전 영역 무시 설정
        setNeedsUpdateOfHomeIndicatorAutoHidden() // 홈 인디케이터 자동 숨김
        view.insetsLayoutMarginsFromSafeArea = false // 안전 영역 무시
        
        // 상태바와 네비게이션바 숨기기
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // 홈 인디케이터 자동 숨김 설정
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true // 홈 인디케이터 자동 숨김
    }
    
    func applyUnderline(to text: String, underlinedWords: [String]) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: text)
        
        for word in underlinedWords {
            var range = (text as NSString).range(of: word)
            while range.location != NSNotFound {
                attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
                let nextRangeLocation = range.location + range.length
                range = (text as NSString).range(of: word, options: [], range: NSRange(location: nextRangeLocation, length: text.count - nextRangeLocation))
            }
        }
        
        return attributedText
    }

    // ✅ UI 업데이트 메서드 (다크 모드 & 라이트 모드 지원)
    private func updateUIForTheme() {
        let isDarkMode = traitCollection.userInterfaceStyle == .dark

        view.backgroundColor = isDarkMode ? .black : .white
        contentView.backgroundColor = isDarkMode ? .black : .white

        questionLabel.textColor = isDarkMode ? .white : .black
        progressLabel.textColor = isDarkMode ? .lightGray : .darkGray

        closeButton.setTitleColor(isDarkMode ? .orange : .red, for: .normal)
        
        nextButton.backgroundColor = isDarkMode ? .darkGray : .blue
        nextButton.setTitleColor(isDarkMode ? .white : .white, for: .normal)
        
        optionsStackView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                button.backgroundColor = isDarkMode ? .darkGray : .lightGray
                button.setTitleColor(isDarkMode ? .white : .black, for: .normal)
            }
        }
    }
    
    private func setupUI() {
        // 풀스크린 설정 강화
        view.frame = UIScreen.main.bounds // 전체 화면 영역으로 설정
        view.backgroundColor = .white
        
        // 스크롤뷰 설정
        scrollView.frame = view.bounds
        scrollView.alwaysBounceVertical = true
        scrollView.contentInsetAdjustmentBehavior = .never // 자동 인셋 조정 비활성화
        view.addSubview(scrollView)
        
        contentView.frame = view.bounds
        scrollView.addSubview(contentView)
        
        // 닫기 버튼 - 작게 만들고 상단 모서리에 배치
        closeButton = UIButton(type: .system)
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(.red, for: .normal)
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        contentView.addSubview(closeButton)
        
        // 진행률 라벨 - 더 작게 표시
        progressLabel = UILabel()
        progressLabel.textAlignment = .center
        progressLabel.text = "0%"
        progressLabel.font = UIFont.systemFont(ofSize: 14)
        progressLabel.textColor = .darkGray
        contentView.addSubview(progressLabel)
        
        // 문제 라벨 - 더 큰 글씨로
        questionLabel = UILabel()
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        contentView.addSubview(questionLabel)
        
        // 이미지뷰 - 더 크게 만들기
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        
        // 이미지 탭 제스처 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        
        contentView.addSubview(imageView)
        
        // 옵션 스택뷰 - 더 크고 간격 조정
        optionsStackView = UIStackView()
        optionsStackView.axis = .vertical
        optionsStackView.spacing = 12 // 간격 약간 증가
        optionsStackView.distribution = .fillEqually
        contentView.addSubview(optionsStackView)
        
        // 다음 버튼 - 더 크게 만들기
        nextButton = UIButton(type: .system)
        nextButton.setTitle("다음 문제", for: .normal)
        nextButton.backgroundColor = .blue
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        nextButton.layer.cornerRadius = 12
        nextButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
        nextButton.isHidden = true // 초기에는 숨김 상태로 설정
        contentView.addSubview(nextButton)
        
        setupConstraints()
        updateUIForTheme() // ✅ UI 테마 적용
    }
    
    private func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // 스크롤뷰가 화면 전체를 채우도록 설정 (SafeArea 무시)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor), // SafeArea 대신 view에 직접 제약
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // 콘텐츠 뷰 설정 - 양쪽 여백 최소화
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        // UI 요소들의 제약조건 - 여백 최소화
        NSLayoutConstraint.activate([
            // 닫기 버튼을 오른쪽 상단 모서리에 작게 배치
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            
            // 진행률 라벨을 왼쪽 상단에 작게 배치
            progressLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            // 문제 텍스트를 더 위쪽에 배치하고 여백 최소화
            questionLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // 이미지뷰를 더 크게 만들고 문제 바로 아래 배치
            imageView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            imageView.heightAnchor.constraint(equalToConstant: 220),
            
            // 옵션 스택뷰를 더 크게 만들고 여백 최소화
            optionsStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            optionsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            optionsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // 다음 버튼 배치 - 이제 스택뷰와 같은 제약 조건 사용
            nextButton.topAnchor.constraint(equalTo: optionsStackView.bottomAnchor, constant: 15),
            nextButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            nextButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    private func loadQuestions() {
        questions = JLPTDataLoader1.JLPTN2loadLocalData()
    }
    
    private func displayQuestion() {
        guard currentIndex < questions.count else {
            showScoreCard()
            return
        }
        
        let question = questions[currentIndex]
        
        // 문제 텍스트에 밑줄 적용
        questionLabel.attributedText = applyUnderline(to: question.question ?? "", underlinedWords: question.underline)
        
        // 이미지 표시 (이미지가 있는 경우에만)
        if let imageName = question.imageName, let image = UIImage(named: imageName) {
            imageView.image = image
            imageView.isHidden = false
        } else {
            imageView.isHidden = true
        }
        
        progress = CGFloat(currentIndex) / CGFloat(questions.count - 1)
        progressLabel.text = String(format: "%.0f%%", progress * 100)
        
        optionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // 선택지에 밑줄 적용
        for option in question.options {
            let underlinedText = applyUnderline(to: option, underlinedWords: question.underline)
            let button = UIButton(type: .system)
            
            button.setAttributedTitle(underlinedText, for: .normal)
            button.backgroundColor = .lightGray
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.titleLabel?.textAlignment = .center
            button.layer.cornerRadius = 12
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            // 버튼에 자동 줄 바꿈을 허용하도록 설정
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.lineBreakMode = .byWordWrapping
            
            button.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
            optionsStackView.addArrangedSubview(button)
        }
        
        nextButton.isHidden = true
    }
    
    @objc private func optionSelected(_ sender: UIButton) {
        guard let selectedOption = sender.attributedTitle(for: .normal)?.string else { return }
        let correctAnswer = questions[currentIndex].answer
        
        if selectedOption == correctAnswer {
            sender.backgroundColor = .green
            score += 1
        } else {
            sender.backgroundColor = .red
            // 정답 표시 추가 (선택사항)
            optionsStackView.arrangedSubviews.forEach { view in
                if let button = view as? UIButton, button.attributedTitle(for: .normal)?.string == correctAnswer {
                    button.backgroundColor = .green
                    button.setTitleColor(.white, for: .normal)
                }
            }
        }
        
        optionsStackView.arrangedSubviews.forEach { view in
            (view as? UIButton)?.isUserInteractionEnabled = false
        }
        
        nextButton.isHidden = false
    }
    
    @objc private func closeView() {
        // 풀스크린 모드로 보여진 뷰 컨트롤러를 닫을 때
        // iOS 13부터 프레젠테이션 스타일이 변경될 수 있으므로 명시적으로 설정
        if #available(iOS 13.0, *) {
            self.isModalInPresentation = false
        }
        dismiss(animated: true, completion: nil) // 뷰 컨트롤러 닫기
    }
    
    @objc private func nextQuestion() {
        currentIndex += 1
        DatabaseManager.shared.saveProgress(level: level, quizGroup: quizGroup, index: currentIndex)
        displayQuestion()
        scrollView.setContentOffset(.zero, animated: true)
    }
    
    private func showScoreCard() {
        // Calculate the score
        let scorePercentage = Int(score / CGFloat(questions.count) * 100)
        
        let alert = UIAlertController(title: "퀴즈 완료", message: "점수: \(scorePercentage)%", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "닫기", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
}
