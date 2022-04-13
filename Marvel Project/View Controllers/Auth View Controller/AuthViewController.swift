//
//  AuthViewController.swift
//  Marvel Project
//
//  Created by Guido Mola on 11/04/2022.
//

import UIKit
import FirebaseAuth

protocol AuthViewControllerDelegate: AnyObject{
    func userDidRegister()
    func userDidLogin()
}

class AuthViewController: UIViewController{
    
    private var authViewModel = AuthViewModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    weak var delegate: AuthViewControllerDelegate?
    
    init(authViewModel: AuthViewModel) {
        self.authViewModel = authViewModel
        super.init(nibName: .none, bundle: .none)
        self.authViewModel.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didPressLogin(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            authViewModel.userLogin(email: email, password: password)
        }
    }
    
    @IBAction func didPressRegister(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            authViewModel.userRegistration(email: email, password: password)
        }
    }
}

extension AuthViewController: UserDidRegisterDelegate{
    func didLoginCorrectly() {
        self.delegate?.userDidLogin()
    }
    
    func didRegisterCorrectly() {
        self.delegate?.userDidRegister()
    }
}



