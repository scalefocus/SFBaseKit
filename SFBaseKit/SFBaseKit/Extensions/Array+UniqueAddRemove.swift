//
//  Array+UniqueAddRemove.swift
//  BaseKit
//
//  Created by martin.vasilev on 7/10/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    mutating func appendUnique(_ data: Element, shouldOverwrite: Bool = true) {
        guard let index = firstIndex(of: data) else {
            append(data)
            return
        }
        
        if shouldOverwrite {
            self[index] = data
        }
    }
    
    mutating func removeUnique(_ data: Element) {
        if let index = firstIndex(of: data) {
            remove(at: index)
        }
    }
    
}
