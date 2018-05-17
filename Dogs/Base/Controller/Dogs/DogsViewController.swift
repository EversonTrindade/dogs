//
//  DogsViewController.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {

    private var dogsDTO = DogsDTO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dogsDTO.token)
    }
    
    func fill(dogsDTO: DogsDTO) {
        self.dogsDTO = dogsDTO
    }
}
