import UIKit

let num : Int
if 1 > 0{
    num = 3
} else {
    num = 4
}

let t = (1,"")

let strInt : Int? = Int("abc")

func findIndex(of str : String, in array : [String]) -> Int?{
    for (index, val) in array.enumerated(){
        if val == str{
            return index
        }
    }
    
    return nil
}

findIndex(of: "a", in: ["b","c"])

var num1 : Int? = 3
var num2 : Int? = 4

num2 = nil

let result : Int
if num1 != nil && num2 != nil{
    result = num1! + num2!
} else {
    result = -1
}

func intValueFrom(array : [String]?) -> Int{
    let firstStr : String? = array?.first
    if firstStr != nil{
        let nonOptionalString = firstStr!
        let numVal : Int? = Int(nonOptionalString)
        if numVal != nil{
            return numVal!
        }
    }
    
    return -1
}

if let index = findIndex(of: "a", in: []){
    index
}

if let number1 = num1, let number2 = num2{
    print(number1 + number2)
} else {
    print("found nil")
}

let optionalArrayOfString : [String]? = nil

if let arr = optionalArrayOfString,
    let firstStr = arr.first,
    let intVal = Int(firstStr){
    intVal
}

if let firstStr = optionalArrayOfString?.first,
    let intVal = Int(firstStr){
    intVal
}



















