//
//  JLPTN1SelectViewController.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/20/25.
//

import UIKit

class JLPTN1SelectViewController: UIViewController {
    private let readingButton = UIButton(type: .system)
    private let listeningButton = UIButton(type: .system)
    private let readingLabel = UILabel()
    private let listeningLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupButton(button: readingButton, action: #selector(openQuizView), iconName: "book.fill")
        setupButton(button: listeningButton, action: #selector(openListeningQuizView), iconName: "headphones")
        
        setupLabel(label: readingLabel, text: "JLPT N1")
        setupLabel(label: listeningLabel, text: "JLPT N1")
        
        view.addSubview(readingButton)
        view.addSubview(listeningButton)
        view.addSubview(readingLabel)
        view.addSubview(listeningLabel)
    }
    
    private func setupButton(button: UIButton, action: Selector, iconName: String) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular)
        let icon = UIImage(systemName: iconName, withConfiguration: configuration)
        button.setImage(icon, for: .normal)
        button.tintColor = UIColor.label  // 변경: 다크 모드 지원
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: action, for: .touchUpInside)
    }
    
    private func setupLabel(label: UILabel, text: String) {
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let screenWidth = view.frame.width
        let screenHeight = view.frame.height
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 100
        
        if screenWidth > screenHeight { // 가로 모드
            let halfWidth = screenWidth / 2
            readingButton.frame = CGRect(x: halfWidth / 2 - buttonWidth / 2, y: (screenHeight - buttonHeight) / 2, width: buttonWidth, height: buttonHeight)
            listeningButton.frame = CGRect(x: halfWidth + halfWidth / 2 - buttonWidth / 2, y: (screenHeight - buttonHeight) / 2, width: buttonWidth, height: buttonHeight)
        } else { // 세로 모드
            let topHalfCenterY = screenHeight * 0.25
            let bottomHalfCenterY = screenHeight * 0.75
            readingButton.frame = CGRect(x: (screenWidth - buttonWidth) / 2, y: topHalfCenterY - buttonHeight / 2, width: buttonWidth, height: buttonHeight)
            listeningButton.frame = CGRect(x: (screenWidth - buttonWidth) / 2, y: bottomHalfCenterY - buttonHeight / 2, width: buttonWidth, height: buttonHeight)
        }
        
        readingLabel.frame = CGRect(x: readingButton.frame.minX, y: readingButton.frame.maxY + 5, width: buttonWidth, height: 20)
        listeningLabel.frame = CGRect(x: listeningButton.frame.minX, y: listeningButton.frame.maxY + 5, width: buttonWidth, height: 20)
    }
    
    @objc private func openQuizView() {
        let quizVC = JLPTN1ViewController()
        present(quizVC, animated: true)
    }
    
    @objc private func openListeningQuizView() {
        let listeningQuizVC = JLPTN1ListeningViewController()
        present(listeningQuizVC, animated: true)
    }
}
