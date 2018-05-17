//
//  DogsViewController.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    private var dogsDTO = DogsDTO()
    lazy var viewModel: DogsViewModelPresentable = DogsViewModel()

    
    // MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Functions
    func fill(dogsDTO: DogsDTO) {
        self.dogsDTO = dogsDTO
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DogsCell", for: indexPath) as? DogsCell else {
            return UITableViewCell()
        }
        cell.fillCell(token: dogsDTO.token, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow()
    }
}
