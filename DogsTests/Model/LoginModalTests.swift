//
//  LoginModalTests.swift
//  DogsTests
//
//  Created by Everson Trindade on 18/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import XCTest
@testable import Dogs

class LoginModalTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testShouldValidateLoginResult() {
        guard let mocket = readJSON(name: "MockedLogin"), let login = try? JSONDecoder().decode(Login.self, from: mocket) else {
            return
        }
        
        XCTAssert(login.user._id == "5afc796647d5ad004fe3e926")
        XCTAssert(login.user.createdAt == "2018-05-16T18:33:10.526Z")
        XCTAssert(login.user.token == "eyJhbGciOiJIUzI1N")
        XCTAssert(login.user.updatedAt == "2018-05-16T18:33:10.526Z")
    }
}
