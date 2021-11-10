//
//  NotificationName+Custom.swift
//  BaseKit
//
//  Created by Plamen Penchev on 12.10.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import Foundation

public extension Notification.Name {
    static let willEnterForeground = Notification.Name(rawValue: "willEnterForeground")
    static let didEnterBackground = Notification.Name(rawValue: "didEnterBackground")
    static let switchDidChangeState = Notification.Name("switchDidChangeState")
    static let sliderDidChangeValue = Notification.Name("sliderDidChangeValue")
    static let stepperDidChangeValue = Notification.Name("stepperDidChangeValue")
    static let segementedControlDidChangeSelectedIndex = Notification.Name("segmentedControlDidChangeSelectedIndex")
    static let datePickerDidChangeValue = Notification.Name("datePickerDidChangeValue")
    static let pageControlDidChangeCurrentPage = Notification.Name("pageControlDidChangeCurrentPage")
    static let colorWellDidChangeSelectedColor = Notification.Name("colorWellDidChangeSelectedColor")
}
