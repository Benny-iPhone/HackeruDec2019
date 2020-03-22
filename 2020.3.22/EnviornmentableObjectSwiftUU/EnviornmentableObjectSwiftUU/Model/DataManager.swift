//
//  DataManager.swift
//  EnviornmentableObjectSwiftUU
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

class DataManager : ObservableObject{
    @Published private(set) var people : [Person]
    
    init() {
        self.people = [
            Person(firstName: "David", lastName: "Cohen"),
            Person(firstName: "Shimon", lastName: "Levi")
        ]
    }
    
    func add(person : Person) {
        self.people.append(person)
    }
    
}
