//
//  FeatherError.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2022. 03. 05..
//

import Foundation

/// default error response object
public struct FeatherError: Codable {

    /// error message
    public let message: String
    
    /// various error details about the underlying issue
    public let details: [FeatherErrorDetail]
    
    /// init a new error object using a message and the details
    public init(message: String, details: [FeatherErrorDetail]) {
        self.message = message
        self.details = details
    }
}
