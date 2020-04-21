//
//  HomeCoordinator.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Geyman on 21.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

protocol HomeSceneDelegate: Coordinator {
    
}

class HomeCoordinator: Coordinator {
    
    unowned private var navController: UINavigationController!
    
    override func start() {
        
        // Instantiate Home Screen and add scene delegate.
        let rootVC = HomeViewController.instantiateFromStoryboard()
        rootVC?.sceneDelegate = self
        
        // As login flow is finished new navigation flow is started.
        let navController = UINavigationController(rootViewController: rootVC ?? UIViewController())
        self.navController = navController
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = navController
        navController.popToRootViewController(animated: true)
    }
}

// MARK: HomeScreenDelegate
extension HomeCoordinator: HomeSceneDelegate {
    
}
