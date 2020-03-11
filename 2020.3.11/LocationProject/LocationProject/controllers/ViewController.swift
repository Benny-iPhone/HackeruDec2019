//
//  ViewController.swift
//  LocationProject
//
//  Created by Teacher on 11/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var mapArray : [PointOfInterest] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UserLocationManager.manager.start()
        self.mapArray = DataManager.manager.poiArray
        print(mapArray.count)
        
        mapView.addAnnotations(mapArray)
    }


}

