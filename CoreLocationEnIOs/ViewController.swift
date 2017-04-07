//
//  ViewController.swift
//  CoreLocationEnIOs
//
//  Created by alumno on 4/6/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var textViewCoordenates: UITextView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //manager.desiredAccuracy = 10
        manager.distanceFilter = 5
        
        manager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func actionEnableLocation(_ sender: UIButton) {
        print("actionEnableLocation")
        
        print("CLLocationManager.authorizationStatus(): \(CLLocationManager.authorizationStatus())")
                
        if CLLocationManager.authorizationStatus() != .authorizedAlways {
            manager.requestAlwaysAuthorization()
            
        }
        
        
        //manager.startUpdatingLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let ubication = locations[0].coordinate
        
        textViewCoordenates.text = textViewCoordenates.text+"\n[\(ubication.latitude), \(ubication.longitude)]"
        
        
        
        
        
    }
    
    
    
    @IBAction func btnRequestLocation(_ sender: UIButton) {
        
        //manager.requestLocation()
        let ubicacion = manager.location
        if (ubicacion != nil) {
            let coordenadas = ubicacion?.coordinate
            
        textViewCoordenates.text = textViewCoordenates.text+"\nUbicación solicitada: [\(coordenadas?.latitude), \(coordenadas?.longitude)]"
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("erro")
    }
    
    
    
    /*
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
    }
 */
    
    
}

