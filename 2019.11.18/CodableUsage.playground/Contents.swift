import UIKit

struct Item : Codable{
    let id : Int
    let name : String
}

typealias MyDictionary = [String:Any]
let arr : [MyDictionary] = [
    ["id":1,"name":"Item 1"],
    ["id":2,"name":"Item 2"],
    ["id":3,"name":"Item 3"]
]

let jsonData = try! JSONSerialization.data(withJSONObject: arr, options: .init())

let itemsArray = try! JSONDecoder().decode([Item].self, from: jsonData)
itemsArray




