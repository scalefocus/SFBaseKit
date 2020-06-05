//
//  AppCoordinator.swift
//  SFBaseKitDemo
//
//  Created by Vesela Ilchevska on 15.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

protocol AppSceneDelegate: Coordinator {
    
    /// Starts navigation from First Login Scene.
    func shouldShowLoginScene()
    
    /// Starts navigation from First Home Scene.
    func shouldShowHomeScene()
}

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    private let window: UIWindow?
    
    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
        super.init()
        
        let navigationController = setWindowRootViewController()
        
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        addChildCoordinator(loginCoordinator)
    }
    
    override func start() {
        childCoordinators.first?.start()
    }
    
    @discardableResult private func setWindowRootViewController() -> UINavigationController {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return navigationController
    }
}

// MARK: AppSceneDelegate
extension AppCoordinator: AppSceneDelegate {
    func shouldShowLoginScene() {
        let navigationController = setWindowRootViewController()
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        addChildCoordinator(loginCoordinator)
        loginCoordinator.start()
    }
    
    func shouldShowHomeScene() {
        let navigationController = setWindowRootViewController()
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
    }
}
