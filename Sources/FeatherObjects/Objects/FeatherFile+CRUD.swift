//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 06..
//

import Foundation

public extension FeatherFile {

    struct Directory: Codable {
    
        public struct Create: Codable {
            public let name: String
            public let path: String?

            public init(name: String, path: String? = nil) {
                self.name = name
                self.path = path
            }
        }
    }
    
    struct List: Codable {

        public struct Item: Codable {
            public let path: String
            public let name: String
            public let ext: String?

            public init(path: String, name: String, ext: String? = nil) {
                self.path = path
                self.name = name
                self.ext = ext
            }
            
            public var isDirectory: Bool { ext == nil }
            public var isFile: Bool { !isDirectory }
        }
        
        public let current: Item?
        public let parent: Item?
        public let children: [Item]
        
        public init(current: Item?, parent: Item?, children: [Item]) {
            self.current = current
            self.parent = parent
            self.children = children
        }
    }
}
