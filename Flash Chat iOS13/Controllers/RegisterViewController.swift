//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import FirebaseCore
import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    private var customView: UIView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //customView.isHidden = true
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    // Create an alert controller with an error message
                    let alertController = UIAlertController(
                        title: "Error",
                        message: error.localizedDescription,
                        preferredStyle: .alert
                    )
                    // Add an "OK" button to dismiss the alert
                    alertController.addAction(UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: nil)
                    )
                    alertController.addAction(UIAlertAction(
                        title: "Cancel",
                        style: .default,
                        handler: { _ in
                            self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                        } )
                    )
                    // Present the alert on the current view controller
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                }
            }
        }
    }
}
