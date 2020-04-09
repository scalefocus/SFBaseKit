//
//  UIView+CurrentFirstResponder.swift
//  BaseKit
//
//  Created by Dimitar V. Petrov on 4.12.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Recursively searchs for `firstResponder` in `self` and subviews.
    var currentFirstResponder: UIView? {
        if isFirstResponder {
            return self
        }
        
        for view in subviews {
            if let firstResponder = view.currentFirstResponder {
                return firstResponder
            }
        }
        
        return nil
    }
    
    /// Returns the `resignFirstResponder` value of the `currentFirstResponder` or
    /// returns nil if there is no currentFirstResponder.
    @discardableResult
    func resignCurrentFirstResponder() -> Bool? {
        return currentFirstResponder?.resignFirstResponder()
    }
    
}
