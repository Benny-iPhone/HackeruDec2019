//
//  PointOfInterest.swift
//  LocationProject
//
//  Created by Teacher on 11/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation
import MapKit

class PointOfInterest : NSObject, Codable{
    var location : CLLocation {
        return CLLocation(latitude: self.latitude, longitude: self.longitude)
    }
    
    let fullname : String
    let latitude : Double
    let longitude : Double
}

extension PointOfInterest : MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    var title: String? {
        return fullname
    }
}
