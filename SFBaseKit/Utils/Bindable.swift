//
//  Bindable.swift
//  SFBaseKit
//
//  Created by Nikola B Nikolov on 19.10.21.
//  Copyright © 2021 Upnetix. All rights reserved.
//

import UIKit

@available(iOS 13, *)
public protocol Bindable {
    
    /// Type of values associated with the bindable.
    associatedtype BindingType
    
    /// Publisher of the values.
    var publisher: NotificationCenter.Publisher { get }
    
    /// Value of the BindingType.
    var value: BindingType { get }
    
    /// Adds a target that calls the NotificationCenter to post the appropriate notification for the valueChanged event.
    func addTarget()
    
    /// Updates the relevant value of the Bindable based on changes to the bound observable property's value.
    /// - Parameters:
    ///   - value: Value to set.
    ///   - animateUpdates: Animates the value change if the Bindable's control type supports it.
    func setValue(_ value: BindingType, animateUpdates: Bool)
}

/// Extension providing a default implementation of `addTarget()` for Bindables that don't use it.
@available(iOS 13, *)
public extension Bindable {
    func addTarget() {}
}
