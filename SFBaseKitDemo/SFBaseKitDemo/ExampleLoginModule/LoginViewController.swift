//
//  LoginViewController.swift
//  SFBaseKitDemo
//
//  Created by Vesela Ilchevska on 15.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import UIKit
import SFBaseKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    unowned var sceneDelegate: LoginSceneDelegate!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func forgottenPasswordButtonOnPress(_ sender: Any) {
        sceneDelegate?.loginSceneShouldContinueToForgottenPassword()
    }
    
    @IBAction func loginButtonOnPress(_ sender: Any) {
        sceneDelegate?.loginSceneShouldContinueToHome()
    }
}

// MARK: - StoryboardInstantiatable
extension LoginViewController: StoryboardInstantiatable {
    static var storyboardName: String {
        return "LoginScreen"
    }
}
