//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 04..
//


public extension System {
    
    struct File: FeatherApiModel {
        public typealias Module = System
    }
}

public extension System.File {
    
    struct Detail: Codable {

        public let path: String
        public let name: String
        public let ext: String

        public init(path: String, name: String, ext: String) {
            self.path = path
            self.name = name
            self.ext = ext
        }
        
        public var key: String {
            var safePath = path
            if !path.hasSuffix("/") {
                safePath += "/"
            }
            return safePath + name + "." + ext
        }
    }
   
}
