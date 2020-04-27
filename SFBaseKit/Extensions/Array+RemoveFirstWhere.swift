//
//  Array+RemoveFirstWhere.swift
//  BaseKit
//
//  Created by Aleksandar Geyman on 13.03.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import Foundation

public extension Array {
    
    /// Removes and returns the first element of the collection which satisfies the
    /// given predicate.
    ///
    /// You can use the predicate to find and remove an element that matches particular criteria.
    ///
    ///     var cookieJar = [CookieProtocol]()
    ///     _ = cookieJar.removeFirst(where: {$0.ingredients.contains("Chocolate")})
    ///
    /// - Parameter predicate: A closure that takes an element as its argument
    ///   and returns a Boolean value that indicates whether the passed element
    ///   represents a match.
    /// - Returns: The first element of the collection for which `predicate` returns
    ///   `true`. If no elements in the collection satisfy the given predicate,
    ///   returns `nil`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the collection.
    @discardableResult mutating func removeFirst(where predicate: (Element) -> Bool) -> Element? {
        guard let index = firstIndex(where: predicate) else { return nil }
        
        return remove(at: index)
    }
}
