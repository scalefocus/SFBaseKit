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
    
    // MARK: - Properties
    private var navigationController: UINavigationController?
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let loginViewController = LoginViewController.instantiateFromStoryboard() ?? UIViewController()
        navigationController?.pushViewController(loginViewController, animated: false)
    }
}
