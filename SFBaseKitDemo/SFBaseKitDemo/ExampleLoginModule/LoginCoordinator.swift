//
//  LogingCoordinator.swift
//  SFBaseKitDemo
//
//  Created by Vesela Ilchevska on 15.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import Foundation
import SFBaseKit

protocol LoginSceneDelegate: Coordinator {
    func loginSceneShouldContinueToForgottenPassword()
    func loginSceneShouldContinueToHome()
}

class LoginCoordinator: Coordinator {
    
    // MARK: - Properties
    unowned let navigationController: UINavigationController
    
    // MARK: - Coordinator
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        guard let loginViewController = LoginViewController.instantiateFromStoryboard() else { return }
        loginViewController.sceneDelegate = self
        navigationController.pushViewController(loginViewController, animated: false)
    }
}

// MARK: - LoginSceneDelegate
extension LoginCoordinator: LoginSceneDelegate {
    
    /// Navigation flow for presenting forgotten password screen.
    func loginSceneShouldContinueToForgottenPassword() {
        guard let forgottenPasswordViewController = ForgottenPasswordViewController.instantiateFromStoryboard() else { return }
        navigationController.present(forgottenPasswordViewController, animated: true, completion: nil)
    }
    
    /// Application navigation flow after successful log in.
    func loginSceneShouldContinueToHome() {
        
        // Finish current coordinator.
        finish()
        
        // Start new coordinator.
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        
        // Add new coordinator as child coordinator.
        parentCoordinator?.addChildCoordinator(homeCoordinator)
    }
}
