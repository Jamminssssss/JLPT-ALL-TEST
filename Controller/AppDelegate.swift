//
//  AppDelegate.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/20/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // MainTabBarController를 루트 뷰 컨트롤러로 설정
        let viewController = ViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

