//
//  FeatherObjectsTests.swift
//  FeatherObjectsTests
//
//  Created by Tibor Bodecs on 2022. 01. 03..
//

import XCTest
@testable import FeatherObjects

final class FeatherObjectsTests: XCTestCase {
    
    func testPermissionEncode() async throws {
        let permission = FeatherPermission("user.account.login")
        let encoder = JSONEncoder()
        let data = try encoder.encode(permission)
        guard let value = String(data: data, encoding: .utf8) else {
            XCTFail("Invalid output")
            return
        }
        let expectation = "{\"namespace\":\"user\",\"context\":\"account\",\"action\":\"login\"}"
        XCTAssertEqual(value, expectation, "Invalid action encode")
    }
    
    func testPermissionDecode() async throws {
        let value = "{\"namespace\":\"user\",\"context\":\"account\",\"action\":\"login\"}"
        let data = value.data(using: .utf8)!
        let decoder = JSONDecoder()
        let permission = try decoder.decode(FeatherPermission.self, from: data)
        
        let expectation = FeatherPermission("user.account.login")
        XCTAssertEqual(permission, expectation)
    }
    
    func testUserPermissionByLevel() async throws {
        let guestUser = FeatherUser(id: .init(), level: .guest, roles: [])
        let user = FeatherUser(id: .init(), level: .authenticated, roles: [])
        let rootUser = FeatherUser(id: .init(), level: .root, roles: [])
        let permission = FeatherPermission("user.account.login")
        
        XCTAssertFalse(guestUser.hasPermission(permission))
        XCTAssertFalse(user.hasPermission(permission))
        XCTAssertTrue(rootUser.hasPermission(permission))
    }
    
    func testUserPermissionByRoles() async throws {
        let permission1 = FeatherPermission("user.account.login")
        let permission2 = FeatherPermission("user.account.register")
        let role = FeatherRole(key: "admins", permissions: [
            permission1
        ])
        
        let guestUser = FeatherUser(id: .init(), level: .guest, roles: [role])
        let user = FeatherUser(id: .init(), level: .authenticated, roles: [role])
        let rootUser = FeatherUser(id: .init(), level: .root, roles: [role])
        
        
        XCTAssertTrue(guestUser.hasPermission(permission1))
        XCTAssertTrue(user.hasPermission(permission1))
        XCTAssertTrue(rootUser.hasPermission(permission1))
        
        XCTAssertFalse(guestUser.hasPermission(permission2))
        XCTAssertFalse(user.hasPermission(permission2))
        XCTAssertTrue(rootUser.hasPermission(permission2))
    }
    
    func testUserRole() async throws {
        let key = "admins"
        let role = FeatherRole(key: key, permissions: [])
        
        let guestUser = FeatherUser(id: .init(), level: .guest, roles: [role])
        let user = FeatherUser(id: .init(), level: .authenticated, roles: [role])
        let rootUser = FeatherUser(id: .init(), level: .root, roles: [])
        
        
        XCTAssertTrue(guestUser.hasRole(key))
        XCTAssertTrue(user.hasRole(key))
        XCTAssertFalse(rootUser.hasRole(key))
    }
    
    func testPathKeys() async throws {
        struct User: FeatherObjectModule {}
        struct Account: FeatherObjectModel {
            typealias Module = User
        }
        
        XCTAssertEqual(User.pathKey, "user")
        XCTAssertEqual(Account.pathKey, "accounts")
        XCTAssertEqual(Account.pathIdKey, "accountId")
    }
    
    func testAssetKey() async throws {
        struct User: FeatherObjectModule {}
        struct Account: FeatherObjectModel {
            typealias Module = User
        }
        
        XCTAssertEqual(User.assetKey, "user")
        XCTAssertEqual(Account.assetKey, "accounts")
    }
    
    func testPermissionKey() async throws {
        struct User: FeatherObjectModule {}
        struct Account: FeatherObjectModel {
            typealias Module = User
        }
        
        XCTAssertEqual(User.permissionKey, "user")
        XCTAssertEqual(Account.permissionKey, "account")
    }
    
    func testAvailablePermissions() async throws {
        struct User: FeatherObjectModule {}
        struct Account: FeatherObjectModel {
            typealias Module = User
        }
        
        XCTAssertEqual(User.availablePermissions().map(\.key), [
            "user.module.detail"
        ])

        XCTAssertEqual(Account.availablePermissions().map(\.key), [
            "user.account.list",
            "user.account.detail",
            "user.account.create",
            "user.account.update",
            "user.account.patch",
            "user.account.delete"
        ])
        
        XCTAssertEqual(FeatherSystem.availablePermissions().map(\.key), [
            "system.module.detail"
        ])

        XCTAssertEqual(FeatherMetadata.availablePermissions().map(\.key), [
            "system.metadata.list",
            "system.metadata.detail",
            "system.metadata.create",
            "system.metadata.update",
            "system.metadata.patch",
            "system.metadata.delete"
        ])
    }
    
    
    func testFeatherSystem() async throws {
        XCTAssertEqual(FeatherSystem.pathKey, "system")
        XCTAssertEqual(FeatherSystem.assetKey, "system")
        
        XCTAssertEqual(FeatherPermission.pathKey, "permissions")
        XCTAssertEqual(FeatherPermission.pathIdKey, "permissionId")
        XCTAssertEqual(FeatherPermission.assetKey, "permissions")
        
        XCTAssertEqual(FeatherPermission.urlPath, "system/permissions")
        XCTAssertEqual(FeatherPermission.idUrlPath, "system/permissions/:permissionId")
        XCTAssertEqual(FeatherPermission.assetPath, "system/permissions")
        
        XCTAssertEqual(FeatherFile.availablePermissions().count, 3)
    }
    
    func testFeatherMenuSort() async throws {
        let menu = FeatherMenu(key: "test", name: "test menu", items: [
            .init(label: "a", url: "a", priority: 10, isBlank: false, permission: nil),
            .init(label: "b", url: "b", priority: 1000, isBlank: false, permission: nil),
            .init(label: "c", url: "c", priority: 20, isBlank: false, permission: nil),
        ])
        XCTAssertEqual(menu.items[0].label, "b")
        XCTAssertEqual(menu.items[1].label, "c")
        XCTAssertEqual(menu.items[2].label, "a")
    }
}
