//
//  HomeViewController.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Geyman on 21.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

protocol HomeSceneDelegate: Coordinator {
    func homeSceneShouldContinueToLogOut()
}

class HomeViewController: UIViewController {
    
    unowned var sceneDelegate: HomeSceneDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func DidTapOnLogOutButton(_ sender: Any) {
        sceneDelegate.homeSceneShouldContinueToLogOut()
    }
}

// MARK: - StoryboardInstantiatable
extension HomeViewController: StoryboardInstantiatable {
    static var storyboardName: String {
        return "HomeScreen"
    }
}
