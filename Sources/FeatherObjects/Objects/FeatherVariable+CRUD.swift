//
//  FeatherVariable+CRUD.swift
//  FeatherObjects
//
//  Created by Tibor Bodecs on 2022. 02. 23..
//

import Foundation

public extension FeatherVariable {
    
    // MARK: -
    
    struct List: Codable {
        public let id: UUID
        public let key: String
        public let value: String?
        
        public init(id: UUID,
                    key: String,
                    value: String? = nil) {
            self.id = id
            self.key = key
            self.value = value
        }
    }
    
    // MARK: -
    
    struct Detail: Codable {
        public let id: UUID
        public let key: String
        public let name: String
        public let value: String?
        public let notes: String?
        
        public init(id: UUID,
                    key: String,
                    name: String,
                    value: String? = nil,
                    notes: String? = nil) {
            self.id = id
            self.key = key
            self.name = name
            self.value = value
            self.notes = notes
        }
    }
    
    // MARK: -
    
    struct Create: Codable {
        public let key: String
        public let name: String
        public let value: String?
        public let notes: String?
        
        public init(key: String,
                    name: String,
                    value: String? = nil,
                    notes: String? = nil) {
            self.key = key
            self.name = name
            self.value = value
            self.notes = notes
        }
    }
    
    // MARK: -
    
    struct Update: Codable {
        public let key: String
        public let name: String
        public let value: String?
        public let notes: String?
        
        public init(key: String,
                    name: String,
                    value: String? = nil,
                    notes: String? = nil) {
            self.key = key
            self.name = name
            self.value = value
            self.notes = notes
        }
    }
    
    // MARK: -
    
    struct Patch: Codable {
        public let key: String?
        public let name: String?
        public let value: String?
        public let notes: String?
        
        public init(key: String? = nil,
                    name: String? = nil,
                    value: String? = nil,
                    notes: String? = nil) {
            self.key = key
            self.name = name
            self.value = value
            self.notes = notes
        }
    }
}

