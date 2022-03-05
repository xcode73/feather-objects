//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 03..
//

import XCTest
@testable import FeatherApi

final class FeatherApiTests: XCTestCase {

    func testFeatherPermissionEncode() async throws {
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
    
    func testFeatherPermissionDecode() async throws {
        let value = "{\"namespace\":\"user\",\"context\":\"account\",\"action\":\"login\"}"
        let data = value.data(using: .utf8)!
        let decoder = JSONDecoder()
        let permission = try decoder.decode(FeatherPermission.self, from: data)
                
        let expectation = FeatherPermission("user.account.login")
        XCTAssertEqual(permission, expectation)
    }
}
