//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 05..
//

import Foundation

public struct FeatherError: Codable {

    public let message: String
    public let details: [FeatherErrorDetail]
    
    public init(message: String, details: [FeatherErrorDetail]) {
        self.message = message
        self.details = details
    }
}
