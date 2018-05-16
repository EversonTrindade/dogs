//
//  LoginRequest.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class LoginRequest: Requestable {
    
    func request(param: [String: Any], completion: @escaping ( Login?, CustomError?) -> Void) {
        var urlComponents = URLComponents(string: BaseAPI().signup)
        urlComponents?.queryItems = [URLQueryItem(name: "email", value: param["email"] as? String)]
        
        guard let url = urlComponents?.url else {
            completion(nil, CustomError())
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error  in
            if let error = error {
                completion(nil, CustomError(error: error.localizedDescription as? Error))
                return
            }
            guard let dataFromService = data else {
                completion(nil, CustomError())
                return
            }
            guard let login = try? JSONDecoder().decode(Login.self, from: dataFromService) else {
                completion(nil, CustomError())
                return
            }
            completion(login, nil)
            }.resume()
    }
}
