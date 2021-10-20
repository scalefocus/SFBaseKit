//
//  Bindable.swift
//  SFBaseKit
//
//  Created by Nikola B Nikolov on 19.10.21.
//  Copyright © 2021 Upnetix. All rights reserved.
//

import UIKit

@available(iOS 13, *)
public protocol Bindable: UIControl {
    
    /// Type of values associated with the bindable.
    associatedtype BindingType
    
    /// Publisher of the values.
    var publisher: NotificationCenter.Publisher { get }
    
    /// Returns a value of the BindingType from a given publisher output.
    /// - Parameter output: The publisher output to extract a value from.
    func value(from output: NotificationCenter.Publisher.Output) -> BindingType
}
