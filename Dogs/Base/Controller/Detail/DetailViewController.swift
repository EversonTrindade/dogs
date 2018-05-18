//
//  DetailViewController.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

struct DetailDTO {
    var image: Data?
    var name = ""
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var dogImg: UIImageView!
    
    var image: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = self.image else {
            return
        }
        dogImg.image = UIImage(data: image)
    }
    
    func fill(dto: DetailDTO?) {
        self.image = dto?.image
        
        navigationItem.title = dto?.name.uppercased()
    }
}
