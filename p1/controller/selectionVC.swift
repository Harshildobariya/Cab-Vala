//
//  selectionVC.swift
//  p1
//
//  Created by Harshil sureshbhai dobariya on 08/04/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit

class selectionVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var carpicker: UIPickerView!
    let arrCity = ["Swift", "Aulto", "Indigo", "Eartiga", "Innova","Eco",]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arrCity.count
       
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrCity[row]
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    print(arrCity[row])
      
    }

    
    @IBAction func alert(_ sender: Any) {
        
        let alert = UIAlertController(title: "confirmation", message: "your cab is boocked \(String(describing: datelbl.text))", preferredStyle: .alert)
        let alertCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction (UIAlertAction(title: "ok", style: .default, handler: { (action:UIAlertAction) in
            self.performSegue(withIdentifier: "MyMap", sender: Any?.self)
            print("sucess")
        }))
        alert.addAction(alertCancel)
        self.present(alert, animated: true, completion: nil)
     
    }
    
    @IBAction func datepicker(_ sender: Any) {
        //print((sender as AnyObject).date)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd MM yyyy"
        print(dateformatter.string(from: (sender as AnyObject).date))
        
        datelbl.text = dateformatter.string(from: (sender as AnyObject).date)
    }
}


