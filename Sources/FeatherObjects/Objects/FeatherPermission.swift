//
//  FeatherPermission.swift
//  FeatherObjects
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

import Foundation

/// generic permission object
public struct FeatherPermission: Equatable, Codable {

    private static let separator = "."

    /// namespace of the permission, usually the module name
    public let namespace: String
    /// context of the permission, usually a model name
    public let context: String
    /// action for the given namespace & context
    public let action: Action

    /// init a new permission using a namespace, context, action
    public init(namespace: String, context: String, action: Action) {
        self.namespace = namespace
        self.context = context
        self.action = action
    }
    
    /// init a new permission using a key with 3 components (namespace, context, action) separated by a `.`
    public init(_ key: String) {
        let parts = key.components(separatedBy: Self.separator)
        guard parts.count == 3 else {
            fatalError("Invalid permission key")
        }
        self.namespace = parts[0]
        self.context = parts[1]
        self.action = .init(parts[2])
    }
}

public extension FeatherPermission {

    /// namespace, context and action.key as an array of string
    var components: [String] { [namespace, context, action.key] }
    /// string identifier of the permisison (format: namespace.context.action)
    var key: String { components.joined(separator: Self.separator) }
    /// the permission key with an access suffix (format: namespace.context.action.access)
    var accessKey: String { key + Self.separator + "access" }
}
