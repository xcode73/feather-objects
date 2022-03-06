//
//  FeatherPermission+CRUD.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2022. 02. 23..
//

import Foundation

public extension FeatherPermission {
    
    // MARK: -
    
    struct List: Codable {
        public let id: UUID
        public let namespace: String
        public let context: String
        public let action: String
        public let name: String
        
        public init(id: UUID,
                    namespace: String,
                    context: String,
                    action: String,
                    name: String) {
            self.id = id
            self.namespace = namespace
            self.context = context
            self.action = action
            self.name = name
        }
    }
    
    // MARK: -
    
    struct Detail: Codable {
        public let id: UUID
        public let namespace: String
        public let context: String
        public let action: String
        public let name: String
        public let notes: String?
        
        public init(id: UUID,
                    namespace: String,
                    context: String,
                    action: String,
                    name: String,
                    notes: String? = nil) {
            self.id = id
            self.namespace = namespace
            self.context = context
            self.action = action
            self.name = name
            self.notes = notes
        }
    }
    
    // MARK: -
    
    struct Create: Codable {
        public let namespace: String
        public let context: String
        public let action: String
        public let name: String
        public let notes: String?
        
        public init(namespace: String,
                    context: String,
                    action: String,
                    name: String,
                    notes: String? = nil) {
            self.namespace = namespace
            self.context = context
            self.action = action
            self.name = name
            self.notes = notes
        }
        
        public init(_ permission: FeatherPermission) {
            self.namespace = permission.namespace
            self.context = permission.context
            self.action = permission.action.key
            self.name = permission.key
            self.notes = nil
        }
    }
    
    // MARK: -
    
    struct Update: Codable {
        public let namespace: String
        public let context: String
        public let action: String
        public let name: String
        public let notes: String?
        
        public init(namespace: String,
                    context: String,
                    action: String,
                    name: String,
                    notes: String? = nil) {
            self.namespace = namespace
            self.context = context
            self.action = action
            self.name = name
            self.notes = notes
        }
    }
    
    // MARK: -
    
    struct Patch: Codable {
        public let namespace: String?
        public let context: String?
        public let action: String?
        public let name: String?
        public let notes: String?
        
        public init(namespace: String? = nil,
                    context: String? = nil,
                    action: String? = nil,
                    name: String? = nil,
                    notes: String? = nil) {
            self.namespace = namespace
            self.context = context
            self.action = action
            self.name = name
            self.notes = notes
        }
    }
}
