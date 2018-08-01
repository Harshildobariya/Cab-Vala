//
//  AlertController.swift
//  p1
//
//  Created by Harshil sureshbhai dobariya on 05/04/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        let number = numberTF.text
        let adrs = address.text
        
        
        guard let username = usernameTF.text,
        username != "",
        let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
        
            else {
                AlertController.showAlert(self, titel: "Missing Info", message: "Please fill out all fields")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            guard error == nil else {
                AlertController.showAlert(self, titel: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil  else {
                    AlertController.showAlert(self, titel: "Error", message: error!.localizedDescription)
                    return
                }
                
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                DBprovide.Instance.saveUser(withID: user.uid, email: email, password: password, username: username, number: number!,address: adrs!)
            
            })
        })
   
    }
    
}
