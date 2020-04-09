//
//  NotificaitonName+Background.swift
//  BaseKit
//
//  Created by Plamen Penchev on 12.10.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import Foundation

public extension Notification.Name {
    static let willEnterForeground = Notification.Name(rawValue: "willEnterForeground")
    static let didEnterBackground = Notification.Name(rawValue: "didEnterBackground")
}
