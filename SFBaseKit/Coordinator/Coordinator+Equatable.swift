//
//  Coordinator+Equatable.swift
//  BaseKit
//
//  Created by Dimitar V. Petrov on 4.12.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import Foundation

extension Coordinator: Equatable {
    
    public static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }
    
}
