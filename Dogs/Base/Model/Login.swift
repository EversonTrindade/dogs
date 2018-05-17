//
//  Login.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

struct Login: Decodable {
    var user: User
}

struct User: Decodable {
    var _id: String
    var token: String
    var createdAt: String
    var updatedAt: String
}
