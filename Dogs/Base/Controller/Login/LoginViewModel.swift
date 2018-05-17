//
//  LoginViewModel.swift
//  Dogs
//
//  Created by Everson Trindade on 16/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol LoginLoadContent: class {
    func didLoadContent(user: Login?, error: String?)
}

protocol LoginViewModelPresentable: class {
    func login(email: String)
}

class LoginViewModel: LoginViewModelPresentable {
    
    // MARK: Properties
    weak var loginLoadContent: LoginLoadContent?
    var interactor: LoginInteractorPresentable?
    
    // MARK: Init
    init() {
        
    }
    
    init(loginLoadContent: LoginLoadContent, interactor: LoginInteractorPresentable = LoginInteractor()) {
        self.loginLoadContent = loginLoadContent
        self.interactor = interactor
    }
    
    // MARK: Functions
    func login(email: String) {
        interactor?.login(param: ["email" : email], completion: { login, error in
            self.loginLoadContent?.didLoadContent(user: login, error: error)
        })
    }
}
