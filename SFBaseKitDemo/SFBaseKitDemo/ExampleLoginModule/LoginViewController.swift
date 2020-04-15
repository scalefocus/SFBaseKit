//
//  LoginViewController.swift
//  SFBaseKitDemo
//
//  Created by Vesela Ilchevska on 15.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import UIKit
import SFBaseKit

class LoginViewController: UIViewController, CoordinatableViewController {
   unowned var coordinatorDelegate: CoordinatorSceneDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgottenPasswordButtonOnPress(_ sender: Any) {
        
    }
    
    @IBAction func loginButtonOnPress(_ sender: Any) {
    
    }
}

// MARK: - StoryboardInstantiatable
extension LoginViewController: StoryboardInstantiatable {
    static var storyboardName: String {
        return "LoginScreen"
    }
}
