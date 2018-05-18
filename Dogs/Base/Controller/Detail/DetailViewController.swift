//
//  DetailViewController.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

struct DetailDTO {
    var image = UIImage()
}

class DetailViewController: UIViewController {
    @IBOutlet weak var dogImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fill(dto: DetailDTO) {
        dogImage.image = dto.image
    }
}
