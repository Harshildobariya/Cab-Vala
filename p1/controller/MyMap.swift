//
//  MyMap.swift
//  p1
//
//  Created by Harshil sureshbhai dobariya on 26/07/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MyMap: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var Map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        Map.setRegion(region, animated: true)
      
        self.Map.showsUserLocation = true
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

