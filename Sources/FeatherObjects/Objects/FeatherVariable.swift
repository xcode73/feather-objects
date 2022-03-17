//
//  FeatherVariable.swift
//  FeatherObjects
//
//  Created by Tibor Bodecs on 2022. 03. 05..
//

import Foundation

/// generic variable object
public struct FeatherVariable: Codable {

    /// unique key of the variable
    public let key: String
    
    /// optional value of the variable
    public let value: String?
    
    
    /// init a new variable using a key and a value
    public init(key: String, value: String? = nil) {
        self.key = key
        self.value = value
    }    
}
