//
//  DogRequest.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class DogRequest: Requestable {
    
    func request(param: [String : Any], completion: @escaping ( Dogs?, CustomError?) -> Void) {
        var urlComponents = URLComponents(string: BaseAPI().feed)
        urlComponents?.queryItems = [URLQueryItem(name: "category", value: param["category"] as? String)]
        guard let url = urlComponents?.url else {
            completion(nil, CustomError())
            return
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(param["Authorization"] as? String ?? "", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error  in
            if let error = error {
                completion(nil, CustomError(error: error.localizedDescription as? Error))
                return
            }
            guard let dataFromService = data else {
                completion(nil, CustomError())
                return
            }
            guard let dogs = try? JSONDecoder().decode(Dogs.self, from: dataFromService) else {
                completion(nil, CustomError())
                return
            }
            completion(dogs, nil)
            }.resume()
    }
}
