//
//  AuthCoordinator.swift
//  Marvel Project
//
//  Created by Guido Mola on 11/04/2022.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator{
    
    var onUserAuthenticated: (() -> (Void))?
    
    private let authViewController: AuthViewController
    private let authViewModel: AuthViewModel
    
    public override init(router: RouterType) {
        authViewModel = AuthViewModel()
        authViewController = AuthViewController(authViewModel: authViewModel)
        super.init(router: router)
        authViewController.delegate = self
    }
    
    override func toPresentable() -> UIViewController {
        return authViewController
    }
    

}

extension AuthCoordinator: AuthViewControllerDelegate{
    
    func userDidLogin() {
        onUserAuthenticated?()
    }
    
    func userDidRegister() {
        onUserAuthenticated?()
    }
    
    
}

