//
//  UserLocationManager.swift
//  LocationProject
//
//  Created by Teacher on 11/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation
import CoreLocation

extension Notification.Name {
    static var locationUpdate : Notification.Name {
        return Notification.Name(rawValue: "locationUpdateNotification")
    }
}

class UserLocationManager : NSObject{
    private let locationManager : CLLocationManager
    private var isOn : Bool
    
    var location : CLLocation? {
        return locationManager.location
    }
    
    static let manager = UserLocationManager()
    
    override init() {
        self.locationManager = CLLocationManager()
        self.isOn = false
        super.init()
        
        locationManager.distanceFilter = 50 //meter
        //locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .otherNavigation
        locationManager.delegate = self
    }
    
    func start() {
        
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            self.isOn = true
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            //user refused, or device can not detect location
            self.isOn = false
        case .notDetermined:
            //time to ask user for permission
            self.isOn = true
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
        
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
        self.isOn = false
    }
}

extension UserLocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if isOn {
            start()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        //broadcast notification
        NotificationCenter.default.post(name: .locationUpdate, object: self)
    }
}




















