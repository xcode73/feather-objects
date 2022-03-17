//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 03. 06..
//

import Foundation

/// generic menu item object
public struct FeatherMenuItem: Codable {
    
    /// label of the menu item
    public let label: String
    
    /// absolute url of the menu item
    public let url: String
    
    /// priority of the menu item, default :1000
    public let priority: Int
    
    /// link target is going to be a new tab if true, default false
    public let isBlank: Bool
    
    /// optional permission key to check before displaying a menu item
    public let permission: String?

    public init(label: String,
                url: String,
                priority: Int = 1000,
                isBlank: Bool = false,
                permission: String? = nil) {
        self.label = label
        self.url = url
        self.priority = priority
        self.isBlank = isBlank
        self.permission = permission
    }    
}
