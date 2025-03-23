//
//  JLPTN3SelectViewController.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/22/25.
//

import UIKit

class JLPTN3SelectViewController: UIViewController {
    private let readingButton = UIButton(type: .system)
    private let listeningButton = UIButton(type: .system)
    private let readingLabel = UILabel()
    private let listeningLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupButton(button: readingButton, action: #selector(openQuizView), iconName: "book.fill", color: .yellow)
        setupButton(button: listeningButton, action: #selector(openListeningQuizView), iconName: "headphones", color: .yellow)

        setupLabel(label: readingLabel, text: "JLPT N3")
        setupLabel(label: listeningLabel, text: "JLPT N3")
        
        view.addSubview(readingButton)
        view.addSubview(listeningButton)
        view.addSubview(readingLabel)
        view.addSubview(listeningLabel)
    }
    
    private func setupButton(button: UIButton, action: Selector, iconName: String, color: UIColor) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular)
        if let icon = UIImage(systemName: iconName, withConfiguration: configuration)?
            .withTintColor(color, renderingMode: .alwaysOriginal) {
            button.setImage(icon, for: .normal)
        }
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
        let quizVC = JLPTN3ViewController()
        present(quizVC, animated: true)
    }
    
    @objc private func openListeningQuizView() {
        let listeningQuizVC = JLPTN3ListeningViewController()
        present(listeningQuizVC, animated: true)
    }
}
