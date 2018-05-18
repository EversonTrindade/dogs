//
//  DogViewModelTests.swift
//  DogsTests
//
//  Created by Everson Trindade on 18/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import XCTest
@testable import Dogs

extension XCTestCase {
    func readJSON(name: String) -> Data? {
        let path = Bundle.main.path(forResource: name, ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        return data
    }
}

class DogsViewModelTests: XCTestCase {
    
    let viewModel = DogsViewModel()
    
    override func setUp() {
        super.setUp()

    }
    
    func testShouldValidateNumberOfSections() {
        XCTAssert(viewModel.numberOfSections() == 1)
    }
    
    func testShouldValidateNumberOfRows() {
     XCTAssert(viewModel.numberOfRowsInSection() == 4)
    }
    
    func testShouldValidateheightForRow() {
        XCTAssert(viewModel.heightForRow() == 180.0)
    }
}
