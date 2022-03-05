//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 01..
//

import Foundation

/// generic role object that contains permissions
public struct FeatherRole: Codable {
    /// unique key of the role
    public var key: String
    /// array of permissions associated to the role
    public var permissions: [FeatherPermission]

    /// init a new role object using a key and the permissions
    public init(key: String, permissions: [FeatherPermission]) {
        self.key = key
        self.permissions = permissions
    }
}
