//
//  BaseAPI.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol Requestable: class {
    associatedtype DataType
    func request(param: [String: Any], completion: @escaping (_ result: DataType?, _ error: CustomError?) -> Void)
}

struct BaseAPI {
    fileprivate let base = "https://iddog-api.now.sh/"
    
    var signup: String {
        return base + "signup"
    }
    
    var feed: String {
        return base + "feed"
    }
}
