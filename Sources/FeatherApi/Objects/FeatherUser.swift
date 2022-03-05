//
//  FeatherUser.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

import Foundation

/// generic user object
public struct FeatherUser: Codable {
    
    /// access level of the given user
    public enum Level: String, Codable {
        /// unauthenticated (guest) users
        case guest
        /// authenticated (logged in) users
        case authenticated
        /// root users (with all privileges)
        case root
    }

    /// unique identifier of the user
    public var id: UUID
    
    /// user level
    public var level: Level
    
    /// associated user roles
    public var roles: [FeatherRole]

    /// init a new user with a given level and a set of roles
    public init(id: UUID,
                level: Level,
                roles: [FeatherRole]) {
        self.id = id
        self.level = level
        self.roles = roles
    }

    /// checks if the user has a given permission using a permission object
    public func hasPermission(_ permission: FeatherPermission) -> Bool {
        if level == .root {
            return true
        }
        for role in roles {
            for p in role.permissions {
                if p.key == permission.key {
                    return true
                }
            }
        }
        return false
    }
    
    /// checks if the user has a given permission using a permission key string
    public func hasPermission(_ key: String) -> Bool {
        hasPermission(.init(key))
    }
    
    /// checks if the user has a given role using a unique role key
    public func hasRole(_ key: String) -> Bool {
        roles.contains { $0.key == key }
    }
}
