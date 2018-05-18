//
//  DogsViewController.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

fileprivate struct Identifier {
    static let segue = "segueToDetail"
    static let cell = "DogsCell"
}

class DogsViewController: UIViewController, DogImageDelegate {
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    private var dogsDTO = DogsDTO()
    lazy var viewModel: DogsViewModelPresentable = DogsViewModel()
    
    
    // MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "DOGS"
    }
    
    // MARK: Functions
    func fill(dogsDTO: DogsDTO) {
        self.dogsDTO = dogsDTO
    }
    
    func getDogImageView(image: UIImage?) {
        guard let img = image else {
            return
        }
        performSegue(withIdentifier: Identifier.segue, sender: DetailDTO(image: img))
    }

    // MARK: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifier.segue {
            if let detailViewController = segue.destination as? DetailViewController, let dto = sender as? DetailDTO {
                detailViewController.fill(dto: dto)
            }
        }
    }
}

// MARK: UITableViewDelegate/UITableViewDataSource
extension DogsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cell, for: indexPath) as? DogsCell else {
            return UITableViewCell()
        }
        cell.dogImageDelegate = self
        cell.fillCell(token: dogsDTO.token, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow()
    }
}
