//
//  Car.swift
//  ParkingLot
//
//  Created by Teacher on 18/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import Foundation

struct Car : Codable{
    let vin : String
    let model : String
    let make : String
    let new : Bool
    let color : String
    
    static func loadFrom(file : String) -> [Car] {
        //file url on local disk storage to 'url'
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            return []
        }
        
        //read bytes of file to 'data'
        guard let data = try? Data(contentsOf: url) else {
            return []
        }
        
        //parse using JSONDecoder
        do {
            return try JSONDecoder().decode([Car].self, from: data)
        } catch /*(let parseError)*/{
            //print(parseError)
            print(error)
            return []
        }
    }
}



















