import UIKit

class Person {
    var firstName : String
    var middleName : String?
    var lastName : String
    
    //deignated initializer
    init(firstName : String,middleName : String?, lastName : String){
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
    }
    
    convenience init(firstName : String, lastName : String){
        self.init(firstName: firstName, middleName: nil, lastName: lastName)
    }
    
    convenience init(dict : [String:String]){
        let firstName = dict["first_name"] ?? ""
        let middleName = dict["middle_name"]
        let lastName = dict["last_name"] ?? ""
        
        self.init(firstName: firstName, middleName: middleName, lastName: lastName)
    }
}

let p1 = Person(dict: ["first_name":"Jane","last_name":"Doe"])
p1.lastName
