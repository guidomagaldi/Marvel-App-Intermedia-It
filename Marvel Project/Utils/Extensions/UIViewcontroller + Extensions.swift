//
//  UIViewcontroller + Extensions.swift
//  Marvel Project
//
//  Created by Guido Mola on 09/04/2022.
//

import Foundation
import UIKit
extension UIViewController{
    func showAlert(title: String, message: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

