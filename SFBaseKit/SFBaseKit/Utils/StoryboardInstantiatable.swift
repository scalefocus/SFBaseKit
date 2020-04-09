//
//  StoryboardInstantiatable.swift
//  BaseKit
//
//  Created by Valentin Kaltchev on 3/7/17.
//  Copyright © 2017 Upnetix, Inc. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiatable where Self: UIViewController {
    
    /// Returns the name of the storyboard where the view of the ViewController is.
    static var storyboardName: String { get }
    
    static func instantiateFromStoryboard(withName storyboardName: String,
                                          inBundle bundle: Bundle?) -> Self?
}

//extension won't work in @objc ViewController classes, you will have to implement the method in the ViewController itself.
public extension StoryboardInstantiatable {
    
    static func instantiateFromStoryboard(withName storyboardName: String = storyboardName,
                                          inBundle bundle: Bundle? = nil) -> Self? {
        return UIStoryboard(name: storyboardName,
                            bundle: bundle).instantiateViewController(withIdentifier: String(describing: self)) as? Self
    }
    
}
