//
//  LoginViewController.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

fileprivate struct identifier {
    static let segue = "segueToDogs"
}

class LoginViewController: UIViewController, LoginLoadContent {
    
    // MARK: IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: Properties
    lazy var viewModel: LoginViewModelPresentable = LoginViewModel(loginLoadContent: self)
    
    // MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "LOGIN"
    }
    
    // MARK: IBAction
    @IBAction func loginAction(_ sender: Any) {
        validateEmail(email: emailTextField.text ?? "")
    }
    
    // MARK: Functions
    func didLoadContent(user: Login?, error: String?) {
        dismissLoader()
        guard let user = user else {
            showDefaultAlert(message: "Error from server", completeBlock: nil)
            return
        }
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: identifier.segue, sender: DogsDTO(token: user.user.token))
        }
    }
    
    func validateEmail(email: String) {
        if email.isValidEmail() {
            DispatchQueue.main.async {
                self.showLoader()
            }
            viewModel.login(email: email)
        } else {
            showDefaultAlert(message: "Invalid email", completeBlock: nil)
        }
        
    }
    
    // MARK: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifier.segue {
            if let dogsViewController = segue.destination as? DogsViewController, let dto = sender as? DogsDTO {
                dogsViewController.fill(dogsDTO: dto)
            }
        }
    }
}
