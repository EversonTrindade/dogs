//
//  DogsCellModel.swift
//  Dogs
//
//  Created by Everson Trindade on 17/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol DogsLoadContent: class {
    func didLoadContent(error: String?)
}

protocol DogsCellModelPresentable: class {
    func getCategoryName(index: Int) -> String?
    func getDogs(category: String, token: String)
    func numberOfSections() -> Int
    func numberOfRowsInSection() -> Int
}

class DogsCellModel: DogsCellModelPresentable {
    
    // MARK: Properties
    weak var dogsLoadContent: DogsLoadContent?
    var interactor: DogsInteractorPresentable?
    let categories = ["husky", "hound", "pug", "labrador"]
    var dog: Dogs?
    
    // MARK: Init
    init() { }
    
    init(loadContent: DogsLoadContent, interactor: DogsInteractorPresentable = DogsInteractor()) {
        dogsLoadContent = loadContent
        self.interactor = interactor
    }
    
    // MARK: Functions
    func getDogs(category: String, token: String) {
        let param = ["category" : category, "Authorization" : token]
        
        interactor?.getDogs(param: param, completion: { dogsByCategory, error in
            guard let dogsAndCategory = dogsByCategory else {
                return
            }
            self.dog = dogsAndCategory
            self.dogsLoadContent?.didLoadContent(error: error)
        })
    }
    
    func getCategoryName(index: Int) -> String? {
        return categories.object(index: index)
    }

}

extension DogsCellModel {
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRowsInSection() -> Int {
        return dog?.list.count ?? 0
    }
}
