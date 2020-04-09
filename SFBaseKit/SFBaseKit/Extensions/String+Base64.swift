//
//  String+Base64.swift
//  BaseKit
//
//  Created by Diana Mihaylova on 11.10.19.
//  Copyright © 2019 Upnetix. All rights reserved.
//

import Foundation

extension String {
    
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }
    
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
}
