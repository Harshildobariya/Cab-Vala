//
//  AlertController.swift
//  p1
//
//  Created by Harshil sureshbhai dobariya on 05/04/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit

class AlertController  {
    
    static func showAlert(_ inViewController: UIViewController, titel:String, message:String){
        let Alert = UIAlertController(title: titel, message: message, preferredStyle: .alert)
        let AlertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        Alert.addAction(AlertAction)
       inViewController.present(Alert, animated: true, completion: nil)
    }
}
