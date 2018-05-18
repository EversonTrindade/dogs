//
//  DogsCellModel.swift
//  Dogs
//
//  Created by Everson Trindade on 17/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import UIKit

protocol DogsLoadContent: class {
    func didLoadContent(error: String?)
    func didLoadImage(identifier: String?)
}

protocol DogsCellModelPresentable: class {
    func getCategoryName(index: Int) -> String?
    func getDogs(category: String, token: String)
    func numberOfSections() -> Int
    func numberOfRowsInSection() -> Int
    func imageFromCache(identifier: String) -> UIImage?
    func dogDTO(row: Int) -> DogCellDTO
    func getImageData(row: Int) -> Data?

}

class DogsCellModel: DogsCellModelPresentable {
    
    // MARK: Properties
    weak var dogsLoadContent: DogsLoadContent?
    var interactor: DogsInteractorPresentable?
    var categories = ["husky", "hound", "pug", "labrador"]
    var dog: Dogs?
    private var cache = NSCache<NSString, UIImage>()
    
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

    func getImage(urlString: String) -> UIImage {
        let placeholder = UIImage(named: "icon-placeholder")
        placeholder?.accessibilityIdentifier = "placeholder"
        if urlString.isEmpty {
            cache.setObject(placeholder ?? UIImage(), forKey: NSString(string: urlString))
        }
        
        if let cachedImage = cache.object(forKey: NSString(string: urlString)) {
            return cachedImage
        }
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.cache.setObject(image, forKey: NSString(string: urlString))
                        self.dogsLoadContent?.didLoadImage(identifier: urlString)
                    }
                }
            }).resume()
        }
        return UIImage()
    }
    
    func imageFromCache(identifier: String) -> UIImage? {
        return cache.object(forKey: NSString(string: identifier))
    }
    
    func dogDTO(row: Int) -> DogCellDTO {
        guard let dog = dog?.list else {
            return DogCellDTO()
        }
        return DogCellDTO(identifier: dog.object(index: row) ?? "",
                          image: getImage(urlString: dog.object(index: row) ?? ""))
    }
    
    func getImageData(row: Int) -> Data? {
        guard let image = dogDTO(row: row).image, let imageData = UIImagePNGRepresentation(image) else {
            return nil
        }
        return imageData
    }
    
    func numberOfSections() -> Int {
        return 1
    }
 
    func numberOfRowsInSection() -> Int {
        return dog?.list.count ?? 0
    }
}
