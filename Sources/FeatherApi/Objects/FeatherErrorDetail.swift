//
//  FeatherErrorDetail.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2022. 03. 05..
//

import Foundation

/// error detail with a key to identify the related item and a message
public struct FeatherErrorDetail: Codable {

    /// the key of the referenced field or property
    public let key: String
    
    /// error message
    public let message: String
    
    /// init a new error detail object using a key and a message
    public init(key: String, message: String) {
        self.key = key
        self.message = message
    }
}
