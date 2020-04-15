//
//  AppDelegate.swift
//  BaseKitDemo
//
//  Created by Dimitar V. Petrov on 6.12.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit
import SFBaseKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?
    var appCoordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
  
        // Initialize the window and the appCoordinator
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        return true
    }
}
