//
//  AppCoordinator.swift
//  SFBaseKitDemo
//
//  Created by Vesela Ilchevska on 15.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import Foundation
import SFBaseKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    var window: UIWindow?
    
    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
        super.init()
        
        let navigationController = UINavigationController()
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        addChildCoordinator(loginCoordinator)
    }
    
    override func start() {
        childCoordinators.first?.start()
    }
   
}
