//
//  ViewController.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/20/25.
//

import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let n1VC = UINavigationController(rootViewController: JLPTN1SelectViewController())
        let n2VC = UINavigationController(rootViewController: JLPTN2SelectViewController())
        let n3VC = UINavigationController(rootViewController: JLPTN3SelectViewController())
        let n4VC = UINavigationController(rootViewController: JLPTN4SelectViewController())
        let n5VC = UINavigationController(rootViewController: JLPTN5SelectViewController())

        // 탭바 아이콘 및 타이틀 설정
        n1VC.tabBarItem = UITabBarItem(title: "N1", image: UIImage(systemName: "character.book.closed"), tag: 0)
        n2VC.tabBarItem = UITabBarItem(title: "N2", image: UIImage(systemName: "character.book.closed"), tag: 1)
        n3VC.tabBarItem = UITabBarItem(title: "N3", image: UIImage(systemName: "character.book.closed"), tag: 2)
        n4VC.tabBarItem = UITabBarItem(title: "N4", image: UIImage(systemName: "character.book.closed"), tag: 3)
        n5VC.tabBarItem = UITabBarItem(title: "N5", image: UIImage(systemName: "character.book.closed"), tag: 4)

        // 탭바 컨트롤러에 뷰 컨트롤러 추가
        viewControllers = [n1VC, n2VC, n3VC, n4VC, n5VC]
    }
}
