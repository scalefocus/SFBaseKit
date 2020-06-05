//
//  HomeCoordinator.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Geyman on 21.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

class HomeCoordinator: Coordinator {
    
    unowned private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        guard let rootVC = HomeViewController.instantiateFromStoryboard() else { return }
        rootVC.sceneDelegate = self
        navigationController.pushViewController(rootVC, animated: true)
    }
}

// MARK: HomeScreenDelegate
extension HomeCoordinator: HomeSceneDelegate {
    func homeSceneShouldContinueToLogOut() {
        finish()
        appCoordinator?.shouldShowLoginScene()
    }
}
