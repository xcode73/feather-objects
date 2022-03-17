//
//  FeatherObjectsModel.swift
//  FeatherObjects
//
//  Created by Tibor Bodecs on 2021. 12. 26..
//

/// generic API model
public protocol FeatherObjectModel: FeatherObjectComponent {

    /// the associated Module
    associatedtype Module: FeatherObjectModule
    
    /// key to identify a given object (e.g. userId)
    static var pathIdKey: String { get }
    
    /// full path of the url (module path key + model path key)
    static var urlPath: String { get }
    
    /// full path of the id url (module path key + model path key + :id path key)
    static var idUrlPath: String { get }
    
    /// full path of the asset (module asset key + model asset key)
    static var assetPath: String{ get }
}

public extension FeatherObjectModel {
    
    static var pathIdKey: String { String(describing: self).lowercased() + "Id" }
    static var pathKey: String { String(describing: self).lowercased() + "s" }
    static var assetKey: String{ pathKey }

    static var urlPath: String { Module.pathKey + "/" + pathKey }
    static var idUrlPath: String { urlPath + "/:" + pathIdKey }
    static var assetPath: String{ Module.assetKey + "/" + assetKey }
    
    static func permission(for action: FeatherPermission.Action) -> FeatherPermission {
        .init(namespace: Module.permissionKey, context: permissionKey, action: action)
    }
}
