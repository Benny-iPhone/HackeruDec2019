//
//  DataManager.swift
//  MultiThreading
//
//  Created by Teacher on 15/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

class DataManager {
    static let manager = DataManager()
    
    private(set) var numbers : [Int]? = nil //private(set) == readonly
    
    func loadDataFromDisk() {
        if numbers != nil {
            //data already loaded
            return
        }
        
        print("stating data load")
        sleep(2)
        numbers = (0...100).compactMap{ $0 }
        print("finished loading data")
    }
}
