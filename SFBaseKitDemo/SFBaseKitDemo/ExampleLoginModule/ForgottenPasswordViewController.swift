//
//  ForgottenPasswordViewController.swift
//  SFBaseKitDemo
//
//  Created by Vesela Ilchevska on 15.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

class ForgottenPasswordViewController: UIViewController {
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - StoryboardInstantiatable
extension ForgottenPasswordViewController: StoryboardInstantiatable {
    static var storyboardName: String {
        return "LoginScreen"
    }
}
