//
//  AlertController.swift
//  p1
//
//  Created by Harshil sureshbhai dobariya on 05/04/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit
import FirebaseDatabase

class profileVC: UIViewController {
 
    
    @IBOutlet weak var usernameLBL: UILabel!
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    @IBOutlet weak var numberLBL: UILabel!
    @IBOutlet weak var cityLBL: UILabel!
    @IBOutlet weak var addressLBL: UILabel!
    
    var ref:DatabaseReference?
    var databasehendle:DatabaseHandle?
    
    override func viewDidLoad() {
     super.viewDidLoad()

    }

}
