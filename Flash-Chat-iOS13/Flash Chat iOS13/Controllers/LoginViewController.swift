//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let safeEmail = emailTextfield.text, let safePass = passwordTextfield.text{
            Auth.auth().signIn(withEmail: safeEmail, password: safePass) {authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                }
                else{
                    //Navigate to the ChatViewController
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
