//
//  Person.swift
//  EnviornmentableObjectSwiftUU
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

struct Person : Identifiable{
    let id : UUID
    let firstName : String
    let lastName : String
    
    init(firstName : String, lastName : String) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
    }
    
    static var demo : Person {
        Person(firstName: "Steve", lastName: "Jobs")
    }
}
