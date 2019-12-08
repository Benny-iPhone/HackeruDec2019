import UIKit

//iterate
let ages : [String:Int] = [
    "Amnon":19,
    "Zalman":35,
    "Benny":32,
    "Yoni":22
]

var sumAges1 : Int = 0
for (/*name*/ _ ,age) in ages{
    sumAges1 += age
}

sumAges1 = 0
for keyVal in ages{
    sumAges1 += keyVal.value
}

let allNames = Array(ages.keys)

sumAges1 = 0
for name in allNames{
    guard let age = ages[name] else{ continue }
    //let age = ages[name] ?? 0
    
    sumAges1 += age
}

ages.compactMap{ $0.value}.reduce(0) { $0 + $1 }
ages.reduce(0) { $0 + $1.value }

//contcat

var dict1 : [String:Any] = ["a":1,"b":2]
var dict2 : [String:Any] = ["b":2,"c":3]
dict1["e"] = 5

dict2.forEach { (key,val) in
    if dict1[key] == nil{
        dict1[key] = val
    }
    
    dict1[key] = dict1[key] ?? val
}

//maxVal = max(maxVal,arr[i])
//if arr[i] > maxVal{
//    maxVal = arr[i]
//}

dict1

//practice

//most frequent element in array

