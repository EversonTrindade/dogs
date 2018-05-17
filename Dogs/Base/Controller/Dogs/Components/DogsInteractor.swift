//
//  DogsInteractor.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol DogsInteractorPresentable: class {
    func getDogs(param: [String : String], completion: @escaping (_ object: Dogs?, _ error: String?) -> ())
}

class DogsInteractor: DogsInteractorPresentable {
    func getDogs(param: [String : String], completion: @escaping (_ object: Dogs?, _ error: String?) -> ()) {
        DogsRequest().request(param: param) { result, error in
            completion(result ?? nil, error?.message)
        }
    }
}
