//
//  DogsViewModel.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

struct DogsDTO {
    var token = ""
}

protocol DogsViewModelPresentable: class {
    func numberOfSections() -> Int
    func numberOfRowsInSection() -> Int
    func heightForRow() -> CGFloat
}

class DogsViewModel: DogsViewModelPresentable {
    
    // MARK: Init
    init() { }
}

// MARK: TableViewDTO
extension DogsViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        return 4
    }
    
    func heightForRow() -> CGFloat {
        return 180.0
    }
}
