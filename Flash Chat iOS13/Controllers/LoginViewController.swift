//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import FirebaseCore
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let email = emailTextfield.text
        let password = passwordTextfield.text
        
        if let email = email, let password = password {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self else { return }
                if let error {
                    print(error.localizedDescription)
                } else {
                    print("succes is: \(String(describing: authResult?.description))")
                    performSegue(withIdentifier: Constants.loginSegue, sender: self)
                }
            }
        }
    }
    
}
