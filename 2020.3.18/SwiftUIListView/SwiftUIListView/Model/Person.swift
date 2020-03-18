//
//  Person.swift
//  SwiftUIListView
//
//  Created by Teacher on 18/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

struct Person : Identifiable{
    var id : String {
        return email
    }
    
    let fullname : String
    let email : String
    let age : Int
    
    static var demoPeople : [Person] {
        return [
            Person(fullname: "Benny Davidovitz", email: "benny@gmail.com", age: 32),
            Person(fullname: "Jhon Snow", email: "snow@got.com", age : 24),
            Person(fullname: "Steve Jobs", email: "steve@apple.com", age: 65)
        ]
    }
}
