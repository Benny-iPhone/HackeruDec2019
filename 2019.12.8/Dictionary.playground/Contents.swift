import UIKit

let dict1 = ["a":1,"b":2]
let dict2 : [String:Int] = ["a":1,"b":2]
let dict3 : Dictionary<String,Int> = ["a":1,"b":2]
let emptyDictionary : [String:Int] = [:]

var carDict : [String:Any] = [
    "make":"Mazda",
    "year":2004,
    "model":"3 spririt",
    "abs":true,
    "volume":1445.2
]

//write
carDict["make"] = "Suzuki"
carDict["color"] = "black"

carDict.count

let removedValue = carDict.removeValue(forKey: "abs")
carDict["abs"] = nil

carDict["model"] = 3

carDict

//read

let allKeys = Array(carDict.keys) //Array of String
let allValues = Array(carDict.values) //Array of Any


let model : Any? = carDict["model"]
let modelIntVal = model as? Int
if model is Int{
    let intVal = model as! Int
}

if let modelIntVal2 = carDict["model"] as? Int{
    //carDict["model"] is not nil, and carDict["model"] is Int
    print(modelIntVal2 * 2)
}

let someView = UIView()
let myLabel = UILabel()
myLabel.tag = 3
someView.addSubview(myLabel)

let label = (someView.viewWithTag(3)!) as? UILabel

//let colorStr = carDict["color"] //Any?
let colorStr = carDict["color"] as? String //String?
//if left expression is nil, use the right one
let colorStr2 = carDict["color"] as? String ?? ""
//too long, right?
let colorStr3 = (carDict["color"] as? String != nil) ? (carDict["color"] as! String) : "" //if left

let num1 = 3
let num2 = 4
num1 > num2 ? "abc" : "def"

let textField = UITextField()
textField.text = "4.5"
let textFieldValue = Double(textField.text ?? "") ?? 0

//iterate

//contcat

//practice

//most frequent element in array

//usage in init

struct Dog{
    let name : String
    let race : String
    
    init(dict : [String:Any]){
        //self <= this
        self.name = dict["name"] as? String ?? "No Name"
        self.race = dict["race"] as? String ?? ""
    }
}

Dog(dict: [:])
Dog(dict: ["race":"Lavrador"])

let dogDict : [String : Any] = ["id":1,"name":"Who"]
let dog3 = Dog(dict: dogDict)
