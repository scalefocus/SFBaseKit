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
    func loginSceneShouldContinueToLoginIn()
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
    func loginSceneShouldContinueToForgottenPassword() {
        guard let forgottenPasswordViewController = ForgottenPasswordViewController.instantiateFromStoryboard() else { return }
        navigationController.pushViewController(forgottenPasswordViewController, animated: false)
    }
    
    func loginSceneShouldContinueToLoginIn() {
        /* Initialize new coordinator to navigate to next scene.
         Add the new coordinator to child coordinators.
         start it.
         */
    }
}
