//
//  Array+SafeAtSubscript.swift
//  BaseKit
//
//  Created by Dimitar V. Petrov on 4.12.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import Foundation

public extension Array {
    
    subscript(safeAt index: Int) -> Element? {
        guard index < endIndex, index >= startIndex else { return nil }
        return self[index]
    }
    
}
