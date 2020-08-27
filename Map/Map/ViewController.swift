//
//  ViewController.swift
//  Map
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // MapViewを生成.
        
        let myMapView: MKMapView = MKMapView()
        
        myMapView.frame = self.view.frame

        // 緯度経度
        
        let myLatitude: CLLocationDegrees = 35.623655
        
        let myLongitude: CLLocationDegrees = 139.724858

        // 中心点.
        
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLatitude, myLongitude)
        // MapViewに中心点を設定.
        
        myMapView.setCenter(center, animated: true)
        // 縮尺.
        
        // 表示領域.
        
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: mySpan)

        // MapViewにregionを追加.
        
        myMapView.region = myRegion
        // viewにMapViewを追加.
        
        self.view.addSubview(myMapView)
        // ピンを生成.
        
        let myPin: MKPointAnnotation = MKPointAnnotation()
        
        // 座標を設定.
        
        myPin.coordinate = center
        // タイトルを設定.
        
        myPin.title = "STVてっく"
        // サブタイトルを設定.
        
        myPin.subtitle = "えすてーぶい"
        // MapViewにピンを追加.
        
        myMapView.addAnnotation(myPin)
        
    }
    
    
    
}



