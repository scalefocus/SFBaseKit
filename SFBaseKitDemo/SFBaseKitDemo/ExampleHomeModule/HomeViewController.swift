//
//  HomeViewController.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Geyman on 21.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

class HomeViewController: UIViewController {
    
    unowned var sceneDelegate: HomeSceneDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - StoryboardInstantiatable
extension HomeViewController: StoryboardInstantiatable {
    static var storyboardName: String {
        return "HomeScreen"
    }
}
