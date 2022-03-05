//
//  FeatherPermissionAction.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2022. 03. 05..
//

import Foundation

public extension FeatherPermission {

    /// generic action for permissions
    enum Action: Equatable, Codable {
        /// action for list objects
        case list
        /// action for object details
        case detail
        /// action for creating new objects
        case create
        /// action for updating objects
        case update
        /// action for patching objects
        case patch
        /// action for deleting objects
        case delete
        /// custom action
        case custom(String)
        
        /// array of crud actions (list, detail, create, update, patch, delete)
        public static var crud: [Action] {
            [
                .list,
                .detail,
                .create,
                .update,
                .patch,
                .delete
            ]
        }
        
        /// create a new action using a raw key
        public init(_ key: String) {
            switch key {
            case "list": self = .list
            case "detail": self = .detail
            case "create": self = .create
            case "update": self = .update
            case "patch": self = .patch
            case "delete": self = .delete
            default: self = .custom(key)
            }
        }
        
        /// convert an action to a key using a String value
        public var key: String {
            switch self {
            case .list: return "list"
            case .detail: return "detail"
            case .create: return "create"
            case .update: return "update"
            case .patch: return "patch"
            case .delete: return "delete"
            case .custom(let key): return key
            }
        }
        
        /// custom decoder (decode value from raw string)
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            self = .init(try container.decode(String.self))
        }
        
        /// custom encoder (encode value as raw string)
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(key)
        }
    }
}
