//
//  FeatherSystem.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2022. 03. 05..
//

import Foundation

public enum FeatherSystem: FeatherApiModule {
    
    public static var permissionKey: String { "system" }
    public static var pathKey: String { "system" }
    public static var assetKey: String { "system" }
}

extension FeatherMetadata: FeatherApiModel {
    public typealias Module = FeatherSystem
    
    public static var permissionKey: String { "metadata" }
    public static var pathKey: String { "metadatas" }
    public static var pathIdKey: String { "metadataId" }
}

extension FeatherVariable: FeatherApiModel {
    public typealias Module = FeatherSystem
    
    public static var permissionKey: String { "variable" }
    public static var pathKey: String { "variables" }
    public static var pathIdKey: String { "variableId" }
}

extension FeatherPermission: FeatherApiModel {
    public typealias Module = FeatherSystem
    
    public static var permissionKey: String { "permission" }
    public static var pathKey: String { "permissions" }
    public static var pathIdKey: String { "permissionId" }
}

extension FeatherFile: FeatherApiModel {
    public typealias Module = FeatherSystem
    
    public static var permissionKey: String { "file" }
    public static var pathKey: String { "files" }
    public static var pathIdKey: String { "fileId" }

    public static func availablePermissions() -> [FeatherPermission] {
        [
            FeatherPermission.Action.create,
            FeatherPermission.Action.list,
            FeatherPermission.Action.delete,
        ].map { permission(for: $0) }
    }
}
