//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

/// generic API model
public protocol FeatherApiModel: FeatherApiComponent {

    /// the associated Module
    associatedtype Module: FeatherApiModule
    
    /// key to identify a given object (e.g. userId)
    static var pathIdKey: String { get }
}

public extension FeatherApiModel {
    
    static var pathIdKey: String { String(describing: self).lowercased() + "Id" }
    static var pathKey: String { String(describing: self).lowercased() + "s" }
    
    static func permission(for action: FeatherPermission.Action) -> FeatherPermission {
        .init(namespace: Module.permissionKey, context: permissionKey, action: action)
    }
}
