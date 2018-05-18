//
//  DogCellModelTests.swift
//  DogsTests
//
//  Created by Everson Trindade on 18/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import XCTest
@testable import Dogs

class DogCellModelTests: XCTestCase {
    
    var viewModel = DogsCellModel()
    
    override func setUp() {
        super.setUp()
        viewModel.categories = ["husky", "hound", "pug", "labrador"]
    }
    
    func testShouldValidateGetCategoryName() {
        XCTAssert(viewModel.getCategoryName(index: 0) == "husky")
    }
    
    func testShouldValidateNumberOfSections() {
        XCTAssert(viewModel.numberOfSections() == 1)
    }
    
    func testShouldValidateNumberOfRowsInSection() {
        guard let mocket = readJSON(name: "MockedDogs"), let dogs = try? JSONDecoder().decode(Dogs.self, from: mocket) else {
            return
        }
        
        viewModel.dog = dogs
        
        XCTAssert(viewModel.numberOfRowsInSection() == 2)
    }
}
