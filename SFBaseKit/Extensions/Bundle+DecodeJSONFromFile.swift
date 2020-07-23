//
//  Bundle+DecodeFile.swift
//  SFBaseKit
//
//  Created by Vesela Ilchevska on 20.07.20.
//  Copyright © 2020 Upnetix. All rights reserved.
//

import Foundation

public extension Bundle {
    
    /// Decodes JSON file to requested type.
    ///
    /// ```
    /// Bundle.main.decodeFromFile("file", forType: MyObject.self)
    /// ```
    ///
    /// - Parameters:
    ///   - fileName: The name of the JSON file to decode
    ///   - forType: The type of the value to decode.
    ///   - decoder: The decoder to read data from.
    /// - Returns: A value of the requested type.
    func decodeJSONFromFile<T: Decodable>(_ fileName: String,
                                          forType: T.Type,
                                          decoder: JSONDecoder = JSONDecoder()) -> T? {
        
        guard let url = url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url, options: .mappedIfSafe),
            let result = try? decoder.decode(T.self, from: data) else { return nil }
        
        return result
    }
}
