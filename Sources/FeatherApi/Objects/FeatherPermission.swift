//
//  File.swift
//
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

import Foundation

public struct FeatherPermission: Equatable, Codable {

    private static let separator = "."

    public let namespace: String
    public let context: String
    public let action: Action

    public init(namespace: String, context: String, action: Action) {
        self.namespace = namespace
        self.context = context
        self.action = action
    }
        
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

    var components: [String] { [namespace, context, action.key] }
    var key: String { components.joined(separator: Self.separator) }
    var accessKey: String { key + Self.separator + "access" }
}
