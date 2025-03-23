//
//  JLPTN4ListeningViewController.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/22/25.
//

import UIKit
import AVFoundation

class JLPTN4ListeningViewController: UIViewController {
    
    // MARK: - Properties
    private var audioQuestions: [AudioQuestion] = []
    private var currentQuestionIndex = 0
    private let audioPlayer = AudioPlayerManager()
    private var score: CGFloat = 0
    private var progress: CGFloat = 0
    
    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private var closeButton: UIButton!
    private var progressLabel: UILabel!
    private var questionLabel: UILabel!
    private var questionImageView: UIImageView!
    private var audioProgressView: UIProgressView!
    private var audioControlsView: UIView!
    private var playButton: UIButton!
    private var rewindButton: UIButton!
    private var forwardButton: UIButton!
    private var optionsStackView: UIStackView!
    private var nextButton: UIButton!
    
    private let level: String = "N4Audio"
    private let quizGroup: String = "Group8"  // 예시로 그룹을 "Group1"으로 설정
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        loadQuestions()

        if !audioQuestions.isEmpty {
            currentQuestionIndex = DatabaseManager.shared.loadProgress(level: level, quizGroup: quizGroup)

            // Ensure the loaded index is valid
            if currentQuestionIndex >= audioQuestions.count {
                currentQuestionIndex = 0
            }
            
            displayQuestion(at: currentQuestionIndex)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true // 상태 표시줄 숨기기
    }
    
    // 뷰가 나타날 때 호출되는 메서드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 전체화면 모드 설정
        self.modalPresentationStyle = .fullScreen
        // 상태 표시줄 숨기기 위한 설정
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        audioPlayer.stopAudio()
    }
    
    // MARK: - Setup Methods
    private func setupUI() {
        view.backgroundColor = .white
        
        // 스크롤뷰 설정
        scrollView.frame = view.bounds
        scrollView.alwaysBounceVertical = true
        scrollView.contentInsetAdjustmentBehavior = .never // 자동 인셋 조정 비활성화
        view.addSubview(scrollView)
        
        contentView.frame = view.bounds
        scrollView.addSubview(contentView)
        
        // 닫기 버튼
        closeButton = UIButton(type: .system)
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(.red, for: .normal)
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        closeButton.addTarget(self, action: #selector(closeTest), for: .touchUpInside)
        contentView.addSubview(closeButton)
        
        // 진행률 라벨
        progressLabel = UILabel()
        progressLabel.textAlignment = .center
        progressLabel.text = "0%"
        progressLabel.font = UIFont.systemFont(ofSize: 14)
        progressLabel.textColor = .darkGray
        contentView.addSubview(progressLabel)
        
        // 문제 라벨
        questionLabel = UILabel()
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        contentView.addSubview(questionLabel)
        
        // 이미지뷰
        questionImageView = UIImageView()
        questionImageView.contentMode = .scaleAspectFit
        questionImageView.isHidden = true
        contentView.addSubview(questionImageView)
        
        // 오디오 진행바
        audioProgressView = UIProgressView(progressViewStyle: .default)
        audioProgressView.trackTintColor = .lightGray
        audioProgressView.progressTintColor = .systemBlue
        contentView.addSubview(audioProgressView)
        
        // 오디오 컨트롤 뷰
        audioControlsView = UIView()
        audioControlsView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        audioControlsView.layer.cornerRadius = 8
        contentView.addSubview(audioControlsView)
        
        // 오디오 컨트롤 버튼들
        rewindButton = UIButton(type: .system)
        rewindButton.setTitle("-10s", for: .normal)
        rewindButton.tintColor = .systemBlue
        audioControlsView.addSubview(rewindButton)
        
        playButton = UIButton(type: .system)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .systemBlue
        audioControlsView.addSubview(playButton)
        
        forwardButton = UIButton(type: .system)
        forwardButton.setTitle("+10s", for: .normal)
        forwardButton.tintColor = .systemBlue
        audioControlsView.addSubview(forwardButton)
        
        // 옵션 스택뷰
        optionsStackView = UIStackView()
        optionsStackView.axis = .vertical
        optionsStackView.spacing = 12
        optionsStackView.distribution = .fillEqually
        contentView.addSubview(optionsStackView)
        
        // 다음 버튼 (스타일을 옵션 버튼과 일관되게 변경)
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
    }
    
    private func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionImageView.translatesAutoresizingMaskIntoConstraints = false
        audioProgressView.translatesAutoresizingMaskIntoConstraints = false
        audioControlsView.translatesAutoresizingMaskIntoConstraints = false
        rewindButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // 스크롤뷰가 화면 전체를 채우도록 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // 콘텐츠 뷰 설정
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        // UI 요소들의 제약조건
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
            questionImageView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            questionImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            questionImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            questionImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // 오디오 진행바 배치
            audioProgressView.topAnchor.constraint(equalTo: questionImageView.bottomAnchor, constant: 15),
            audioProgressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            audioProgressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            audioProgressView.heightAnchor.constraint(equalToConstant: 10),
            
            // 오디오 컨트롤 뷰 배치
            audioControlsView.topAnchor.constraint(equalTo: audioProgressView.bottomAnchor, constant: 10),
            audioControlsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            audioControlsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            audioControlsView.heightAnchor.constraint(equalToConstant: 60),
            
            // 오디오 컨트롤 버튼들 배치
            rewindButton.leadingAnchor.constraint(equalTo: audioControlsView.leadingAnchor, constant: 20),
            rewindButton.centerYAnchor.constraint(equalTo: audioControlsView.centerYAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: audioControlsView.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: audioControlsView.centerYAnchor),
            
            forwardButton.trailingAnchor.constraint(equalTo: audioControlsView.trailingAnchor, constant: -20),
            forwardButton.centerYAnchor.constraint(equalTo: audioControlsView.centerYAnchor),
            
            // 옵션 스택뷰 배치
            optionsStackView.topAnchor.constraint(equalTo: audioControlsView.bottomAnchor, constant: 15),
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
    
    private func setupActions() {
        playButton.addTarget(self, action: #selector(togglePlayPause), for: .touchUpInside)
        rewindButton.addTarget(self, action: #selector(rewindAudio), for: .touchUpInside)
        forwardButton.addTarget(self, action: #selector(forwardAudio), for: .touchUpInside)
    }
    
    // MARK: - Audio Control Methods
    private func playCurrentQuestionAudio() {
        guard currentQuestionIndex < audioQuestions.count else { return }
        
        let question = audioQuestions[currentQuestionIndex]
        
        // Play audio using the audioFileName, as audioURL has been removed
        audioPlayer.playAudio(named: question.audioFileName)
        
        // Start updating progress
        startProgressUpdateTimer()
    }

    
    private func startProgressUpdateTimer() {
        // Create a timer to update progress view
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            
            let progress = Float(self.audioPlayer.currentTime / self.audioPlayer.duration)
            self.audioProgressView.progress = progress
            
            // Update play button icon
            self.updatePlayButtonImage(isPlaying: self.audioPlayer.isPlaying)
            
            // Invalidate timer if audio is no longer playing
            if !self.audioPlayer.isPlaying && self.audioPlayer.currentTime > 0 {
                timer.invalidate()
            }
        }
    }
    
    private func updatePlayButtonImage(isPlaying: Bool) {
        let imageName = isPlaying ? "pause.fill" : "play.fill"
        playButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    // MARK: - Action Methods
    @objc private func togglePlayPause() {
        if audioPlayer.isPlaying {
            audioPlayer.pauseAudio()
        } else {
            if audioPlayer.currentTime > 0 {
                audioPlayer.resumeAudio()
            } else {
                playCurrentQuestionAudio()
            }
        }
        updatePlayButtonImage(isPlaying: audioPlayer.isPlaying)
    }
    
    @objc private func rewindAudio() {
        audioPlayer.seek(to: audioPlayer.currentTime - 10)
    }
    
    @objc private func forwardAudio() {
        audioPlayer.seek(to: audioPlayer.currentTime + 10)
    }
    
    @objc private func closeTest() {
        dismiss(animated: true)
    }
    
    @objc private func nextQuestion() {
        // Move to the next question
        currentQuestionIndex += 1
        DatabaseManager.shared.saveProgress(level: level, quizGroup: quizGroup, index: currentQuestionIndex)

        // Update progress
        progress = CGFloat(currentQuestionIndex) / CGFloat(audioQuestions.count - 1)
        progressLabel.text = String(format: "%.0f%%", progress * 100)
        
        // If there are more questions, display the next one
        if currentQuestionIndex < audioQuestions.count {
            audioPlayer.stopAudio()
            displayQuestion(at: currentQuestionIndex)
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            // Otherwise, show results
            showResults()
        }
    }
    
    // MARK: - Data Methods
    private func loadQuestions() {
        // Load questions from the data loader
        audioQuestions = JLPTAudioDataLoader1.JLPTN2AudioloadLocalData()
    }
    
    private func displayQuestion(at index: Int) {
        guard index < audioQuestions.count else { return }
        
        let question = audioQuestions[index]
        
        // Set question text
        questionLabel.text = question.question ?? "청취 후 가장 적절한 답을 고르세요."
        
        // Configure answer options
        setupOptionsButtons(with: question.options)
        
        // Update progress
        progress = CGFloat(index) / CGFloat(audioQuestions.count - 1)
        progressLabel.text = String(format: "%.0f%%", progress * 100)
        
        // Reset UI state
        nextButton.isHidden = true // 옵션을 선택하기 전에는 다음 버튼 숨김
        audioProgressView.progress = 0.0
        updatePlayButtonImage(isPlaying: false)
    }
    
    private func setupOptionsButtons(with options: [String]) {
        // Remove any existing option buttons
        optionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // Create and add new option buttons
        for (index, optionText) in options.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(optionText, for: .normal)
            button.backgroundColor = .lightGray
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.layer.cornerRadius = 12
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            button.tag = index
            button.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
            optionsStackView.addArrangedSubview(button)
        }
    }
    
    // MARK: - Option Handling
    @objc private func optionSelected(_ sender: UIButton) {
        // Get the selected option
        guard currentQuestionIndex < audioQuestions.count else { return }
        let selectedIndex = sender.tag
        guard selectedIndex < audioQuestions[currentQuestionIndex].options.count else { return }
        
        let selectedOption = audioQuestions[currentQuestionIndex].options[selectedIndex]
        
        // Update question with user's answer
        audioQuestions[currentQuestionIndex].tappedAnswer = selectedOption
        
        // Check if the selected option is correct
        if selectedOption == audioQuestions[currentQuestionIndex].answer {
            sender.backgroundColor = .green
            score += 1
        } else {
            sender.backgroundColor = .red
            // 정답 표시 추가
            optionsStackView.arrangedSubviews.forEach { view in
                if let button = view as? UIButton, button.tag == audioQuestions[currentQuestionIndex].options.firstIndex(of: audioQuestions[currentQuestionIndex].answer) ?? -1 {
                    button.backgroundColor = .green
                    button.setTitleColor(.white, for: .normal)
                }
            }
        }
        
        // Disable all option buttons
        optionsStackView.arrangedSubviews.forEach { view in
            (view as? UIButton)?.isUserInteractionEnabled = false
        }
        
        // Show and style the next button to match option buttons
        nextButton.isHidden = false
    }
    
    // MARK: - Result Methods
    private func showResults() {
        // Calculate the score
        let scorePercentage = Int(score / CGFloat(audioQuestions.count) * 100)
        
        let alert = UIAlertController(title: "퀴즈 완료", message: "점수: \(scorePercentage)%", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "닫기", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
}
