//
//  SceneDelegate.swift
//  JLPT ALL TEST
//
//  Created by JeaminPark on 3/20/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
            
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

    }

}
