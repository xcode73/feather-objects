//
//  FeatherApiComponent.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

/// generic api component
public protocol FeatherApiComponent {
    
    /// path of the given component for the API endpoint
    static var pathKey: String { get }
    
    /// permission key (context or namespace)
    static var permissionKey: String { get }
    
    /// key to locate the assets
    static var assetKey: String { get }
    
    /// create a new permission object for a given action
    static func permission(for action: FeatherPermission.Action) -> FeatherPermission
    
    /// list the available permissions for a given component (by default CRUD including patch)
    static func availablePermissions() -> [FeatherPermission]
}

public extension FeatherApiComponent {

    static var pathKey: String { String(describing: self).lowercased() }
    static var permissionKey: String { String(describing: self).lowercased() }
    static var assetKey: String { String(describing: self).lowercased() }
    
    static func availablePermissions() -> [FeatherPermission] {
        FeatherPermission.Action.crud.map { permission(for: $0) }
    }
}
