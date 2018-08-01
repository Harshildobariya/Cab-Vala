//
//  DBProvider.swift
//  p1
//
//  Created by Harshil sureshbhai dobariya on 23/07/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBprovide {
    private static let _instance = DBprovide()
    
    static var Instance: DBprovide{
        return _instance
    }
    var dbRef: DatabaseReference{
        return Database.database().reference()
    }
    
    var Rideref:DatabaseReference{
        return dbRef.child(constans.RIDER)
    }
    
    
    //Request
    
    
    
    //Accepted
    
    
    
    func saveUser(withID: String,email:String,password:String,username:String,number:String,address:String) {
        let data : Dictionary<String, Any> = [constans.EMAIL: email, constans.PASSWORD: password,constans.isRider: true,constans.NAME: username,constans.NUMBER:number,constans.ADDRESS:address]
        
        Rideref.child(withID).child(constans.DATA).setValue(data)
    }
    
    
}
