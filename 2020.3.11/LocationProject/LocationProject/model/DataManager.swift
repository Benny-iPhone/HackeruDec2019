//
//  DataManager.swift
//  LocationProject
//
//  Created by Teacher on 11/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

class DataManager {
    static let manager = DataManager()
    var poiArray : [PointOfInterest] = []
    
    init() {
        loadFromFile()
    }
    
    private func loadFromFile() {
        //find file location
        guard let fileURL = Bundle.main.url(forResource: "MOCK_DATA_FIXED", withExtension: "json") else {
            print("file not found")
            return
        }
        
        //read file to binary data
        guard let data = try? Data(contentsOf: fileURL) else {
            print("could not read file")
            return
        }
        
        //parse json data to array of PointOfInterest
        do {
            let array = try JSONDecoder().decode([PointOfInterest].self, from: data)
            self.poiArray = array
        } catch {
            print("invalid json")
            print(error)
        }
        
        
    }
    
}











