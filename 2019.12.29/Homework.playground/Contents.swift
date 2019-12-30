import UIKit
/*
 שיעורי בית:
 בנו מחלקה Product שיש לה id, name, expiryDate
 בנו לה init שמקבל dictionary
 והגדירו func / var שמחזיר האם המוצר פג תוקף
 
 */

class Product {
    let id : String
    let name : String
    let expiryDate : Date
    
    var isExpired : Bool {
        expiryDate.timeIntervalSince1970 < Date().timeIntervalSince1970
    }
    
    init?(_ dict : [String:Any]) {
        //if no id found, abort init
        guard let id = dict["id"] as? String else{
            return nil
        }
        self.id = id
        //self.id = dict["id"] as? String
        //we have tolerancy for missing name, fallback to an empty string
        self.name = dict["name"] as? String ?? ""
        //TimeIntreval is Double, seconds
        let timestamp : TimeInterval = dict["expiryDate"] as? TimeInterval ?? 0
        self.expiryDate = Date(timeIntervalSince1970: timestamp)
    }
}

let p1 = Product([:])
if let p2 = Product(["id":"1f00bac","expiryDate":0]){
    print(p2.isExpired)
}



let dict3 : [String:Any] = [
    "id":"sasf1",
    "name":"a name",
    //"expiryDate":Date().timeIntervalSince1970 + 86_400
    "expiryDate":Date(timeIntervalSinceNow: 86_400).timeIntervalSince1970

]

if let p3 = Product(dict3){
    print(p3.isExpired)
}
















