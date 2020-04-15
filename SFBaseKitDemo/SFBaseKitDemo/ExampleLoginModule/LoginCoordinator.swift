//
//  LogingCoordinator.swift
//  SFBaseKitDemo
//
//  Created by Vesela Ilchevska on 15.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import Foundation
import SFBaseKit

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    override func start() {
        let loginViewController = LoginViewController.instantiateFromStoryboard(withName: "Login Name", inBundle: nil) ?? UIViewController()
        navigationController = UINavigationController(rootViewController: loginViewController)
    }
}
