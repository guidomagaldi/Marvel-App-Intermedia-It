//
//  AuthViewModel.swift
//  Marvel Project
//
//  Created by Guido Mola on 11/04/2022.
//

import Foundation
import FirebaseAuth

protocol UserDidRegisterDelegate: AnyObject{
    func didRegisterCorrectly()
    func didLoginCorrectly()
}



class AuthViewModel{
    
    weak var delegate: UserDidRegisterDelegate?
    
    func userRegistration(email: String, password: String){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error ) in
                if let result = result, error == nil{
                    DispatchQueue.main.async {
                        self.delegate?.didRegisterCorrectly()
                        let defaults = UserDefaults.standard
                        defaults.set(email, forKey: UserDefaultAuthKey.email.rawValue)
                        defaults.set(true, forKey: UserDefaultAuthKey.isLoggedIn.rawValue)
                    }
                   
                }
            }
        }
    
    func userLogin(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error ) in
            if let result = result, error == nil{
                DispatchQueue.main.async {
                    self.delegate?.didLoginCorrectly()
                    let defaults = UserDefaults.standard
                    defaults.set(email, forKey: UserDefaultAuthKey.email.rawValue)
                    defaults.set(true, forKey: UserDefaultAuthKey.isLoggedIn.rawValue)
                }
                
            }
        }
    }
    
}

