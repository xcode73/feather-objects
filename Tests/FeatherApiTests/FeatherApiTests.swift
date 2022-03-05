//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 03..
//

import XCTest
@testable import FeatherApi

final class FeatherApiTests: XCTestCase {

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
    
    func testUserPermissionLevels() async throws {
        let guestUser = FeatherUser(id: .init(), level: .guest, roles: [])
        let user = FeatherUser(id: .init(), level: .authenticated, roles: [])
        let rootUser = FeatherUser(id: .init(), level: .root, roles: [])
        let permission = FeatherPermission("user.account.login")
        
        XCTAssertFalse(guestUser.hasPermission(permission))
        XCTAssertFalse(user.hasPermission(permission))
        XCTAssertTrue(rootUser.hasPermission(permission))
    }
    
    func testUserPermissionRoles() async throws {
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
}
