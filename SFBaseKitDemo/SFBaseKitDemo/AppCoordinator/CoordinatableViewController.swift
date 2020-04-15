//
//  CoordinatableViewController.swift
//  SFBaseKitDemo
//
//  Created by Aleksandar Geyman on 15.04.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import UIKit

protocol CoordinatorSceneDelegate: class {
    
}

protocol CoordinatableViewController: UIViewController {
    var coordinatorDelegate: CoordinatorSceneDelegate! {get set}
}
