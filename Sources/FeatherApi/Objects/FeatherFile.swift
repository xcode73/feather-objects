//
//  FeatherFile.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2022. 03. 04..
//

/// default file component
public struct FeatherFile: Codable {

    /// path of the file
    public let path: String
    /// name of the file
    public let name: String
    /// extension of the file
    public let ext: String

    /// init a file with a given path, name and extension
    public init(path: String, name: String, ext: String) {
        self.path = path
        self.name = name
        self.ext = ext
    }
    
    /// returns the full key of the file in the following format: `path/name.ext`
    public var key: String {
        var safePath = path
        if !path.hasSuffix("/") {
            safePath += "/"
        }
        return safePath + name + "." + ext
    }
}
