//
//  DogsModalTests.swift
//  DogsTests
//
//  Created by Everson Trindade on 18/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import XCTest
@testable import Dogs

class DogsModalTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    func testShouldValidateLoginResult() {
        guard let mocket = readJSON(name: "MockedDogs"), let dogs = try? JSONDecoder().decode(Dogs.self, from: mocket) else {
            return
        }
        
        XCTAssert(dogs.category == "hound")
        XCTAssert(dogs.list.object(index: 0) == "https://dog.ceo/api/img/hound-english/n02089973_1.jpg")
        XCTAssert(dogs.list.object(index: 1) == "https://dog.ceo/api/img/hound-english/n02089973_1000.jpg")
    }

}
