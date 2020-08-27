//
//  ViewController.swift
//  LocationGPS
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    
   override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            if locationManager == nil {
                locationManager = CLLocationManager()
                if #available(iOS 8.0, *) {
                    // NSLocationWhenInUseUsageDescriptionに設定したメッセージでユーザに確認
                    locationManager.requestWhenInUseAuthorization()
                    // NSLocationAlwaysAndWhenInUseUsageDescriptionに設定したメッセージでユーザに確認
                    //locationManager.requestAlwaysAuthorization()
                }
            }
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
     
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
     
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                let latitude = String(format: "%+.06f", location.coordinate.latitude)
                let longitude = String(format: "%+.06f", location.coordinate.longitude)
                let df = DateFormatter()
                df.dateFormat = "yyyy/MM/dd HH:mm:ss"
                let timestamp = df.string(from: location.timestamp)
                print("\(timestamp) \(latitude) \(longitude)")
            }
        }
    }
