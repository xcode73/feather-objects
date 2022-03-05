//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 05..
//

import Foundation

public extension FeatherPermission {
    
    enum Action: Equatable, Codable {
        case list
        case detail
        case create
        case update
        case patch
        case delete
        case custom(String)
        
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
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            self = .init(try container.decode(String.self))
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(key)
        }
    }
}
