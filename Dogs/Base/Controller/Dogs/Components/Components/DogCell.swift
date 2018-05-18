//
//  DogCell.swift
//  Dogs
//
//  Created by Everson Trindade on 17/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

struct DogCellDTO {
    var identifier = ""
    var image: UIImage?
}

class DogCell: UICollectionViewCell {
    
    @IBOutlet weak var dogImage: UIImageView!
    
    var identifier = ""
    
    func fillCell(dto: DogCellDTO) {
        self.identifier = dto.identifier
        dogImage.image = dto.image
        dogImage.setRounded()
    }
    
    func setImage(with image: UIImage?) {
        dogImage.image = image
        dogImage.setRounded()
    }
}
