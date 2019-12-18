//
//  ViewController.swift
//  ParkingLot
//
//  Created by Teacher on 18/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let cars = Car.loadFrom(file: "MOCK_DATA")
        print(cars)
        
    }


}

