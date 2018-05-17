//
//  DogCell.swift
//  Dogs
//
//  Created by Everson Trindade on 17/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

struct DogDTO {
    var image = ""
}

class DogCell: UICollectionViewCell {
    @IBOutlet weak var dogImage: UIImageView!
    
    func fillCell(dto: DogDTO) {
        print(dto.image)
    }
}
