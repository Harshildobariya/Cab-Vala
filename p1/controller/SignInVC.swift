//
//  AlertController.swift
//  p1
//
//  Created by Harshil sureshbhai dobariya on 05/04/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    @IBAction func onSignInTapped(_ sender: Any) {
        
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else {
                AlertController.showAlert(self, titel: "Missing Info", message: "Please fill out all required fields")
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, titel: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.displayName ?? "MISSING DISPLAY NAME")
            print(user.uid)
            
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
            
            
        })
        
    }

}

