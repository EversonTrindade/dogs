//
//  DogsCell.swift
//  Dogs
//
//  Created by Everson Trindade on 17/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

protocol DogImageDelegate: class {
    func getDogImageView(image: UIImage?)
}

class DogsCell: UITableViewCell, DogsLoadContent {

    // MARK: Properties
    private var dogsDTO = DogsDTO()
    lazy var viewModel: DogsCellModelPresentable = DogsCellModel(loadContent: self)
    weak var dogImageDelegate: DogImageDelegate?
    
    // MARK: IBOutlet
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
    }
    
    func fillCell(token: String, index: Int) {
        categoryLbl.text = viewModel.getCategoryName(index: index)?.uppercased()
        viewModel.getDogs(category: viewModel.getCategoryName(index: index) ?? "", token: token)
    }
    
    func didLoadContent(error: String?) {
        if let _ = error {
        } else {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func didLoadImage(identifier: String?) {
        DispatchQueue.main.async {
            guard let collection = self.collectionView else {
                return
            }
            for cell in collection.visibleCells {
                if let dogCell = cell as? DogCell, dogCell.identifier == identifier {
                    dogCell.setImage(with: self.viewModel.imageFromCache(identifier: identifier ?? ""))
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension DogsCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DogCell", for: indexPath) as? DogCell else {
            return UICollectionViewCell()
        }
        cell.fillCell(dto: viewModel.dogDTO(row: indexPath.row))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let gameCell = cell as? DogCell {
            gameCell.fillCell(dto: viewModel.dogDTO(row: indexPath.row))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dogImageDelegate?.getDogImageView(image: viewModel.dogDTO(row: indexPath.row).image)
    }
}
