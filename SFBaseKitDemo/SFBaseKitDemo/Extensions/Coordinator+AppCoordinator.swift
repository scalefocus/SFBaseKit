//
//  Coordinator+AppCoordinator.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Geyman on 27.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import SFBaseKit

extension Coordinator {
    var appCoordinator: AppSceneDelegate? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.appCoordinator
    }
}
