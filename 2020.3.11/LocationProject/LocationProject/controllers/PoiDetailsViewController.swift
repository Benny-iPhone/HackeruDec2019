//
//  PoiDetailsViewController.swift
//  LocationProject
//
//  Created by Teacher on 11/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import CoreLocation

class PoiDetailsViewController: UIViewController {
    
    @IBOutlet weak var addressLabel : UILabel!
    
    var poi : PointOfInterest!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = poi.title
        
        //fetch address
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(poi.location) { (placemarks, error) in
            guard let p = placemarks?.first else {
                print("failed")
                return
            }
            
            let text = [p.country, p.subLocality, p.subThoroughfare, p.thoroughfare, p.subThoroughfare].compactMap{ $0 }.joined(separator: " ")
            self.addressLabel.text = text
        }

    }

}
