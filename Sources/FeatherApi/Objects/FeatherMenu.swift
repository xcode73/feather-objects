//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 06..
//

import Foundation

/// generic menu object that contains menu items
public struct FeatherMenu: Codable {

    /// unique key of the menu
    public let key: String
    /// name of the menu
    public let name: String
    /// array of items associated to the menu
    public let items: [FeatherMenuItem]

    /// init a new menu object using a key and an array of items
    public init(key: String, name: String, items: [FeatherMenuItem]) {
        self.key = key
        self.name = name
        self.items = items.sorted { $0.priority > $1.priority }
    }
}
