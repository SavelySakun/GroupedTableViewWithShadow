//
//  SceneDelegate.swift
//  GroupedTableViewWithShadow
//
//  Created by Savely Sakun on 21.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	let navigationController = UINavigationController()


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let scene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(windowScene: scene)
		let startViewController = ViewController()
		navigationController.viewControllers.append(startViewController)

		window.rootViewController = navigationController
		self.window = window
		window.makeKeyAndVisible()

	}
}

