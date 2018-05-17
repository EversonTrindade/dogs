//
//  LoginInteractor.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol LoginInteractorPresentable: class {
    func login(param: [String : String], completion: @escaping (_ object: Login?, _ error: String?) -> ())
}

class LoginInteractor: LoginInteractorPresentable {
    func login(param: [String : String], completion: @escaping (_ object: Login?, _ error: String?) -> ()) {
        LoginRequest().request(param: param) { result, error in
            completion(result ?? nil, error?.message)
        }
    }
}
