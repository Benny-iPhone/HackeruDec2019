import UIKit

let arr1 = [90,1,2,3,9,4,5,6,7]
var arr2 : [Int] = []

//stride(from: 100, through: 0, by: -1) //100...0
for i in stride(from: 100, to: 0, by: -2){ //100..>0
    arr2.append(i)
}

arr2

let sortedArr1 = arr1.sorted()
arr2.sort()
arr1.sorted(by: >)
//arr1.sorted(by: <#T##(Int, Int) throws -> Bool#>)

let arr3 = [1,5,7,13,770,10,8,6,90,99,39]
/*
 Sort by:
 Divide by 3
 Others
 Subsort: small to big
 */

func sortFunc(_ a : Int, _ b : Int) -> Bool{
    if a % 3 == 0 && b % 3 != 0{
        return true //a first
    } else if a % 3 != 0 && b % 3 == 0{
        return false //b first
    } else {
        return a < b
    }
}

arr3.sorted(by: sortFunc(_:_:))

let r1 = arr3.sorted { (a, b) -> Bool in
    return a % 2 == 0
}

let r2 = arr3.sorted { $0 > $1 }

//sortFunc(3, 4)
//pow(2, 4)

let strArray = ["A","a","z","😘"]
strArray.sorted(by: >)

struct Student{
    let id : Int
    let name : String
}

let students = [
    Student(id: 4, name: "David"),
    Student(id: 2, name: "Eran"),
    Student(id: 3, name: "Avi")
]

//sort by id
students.sorted { (st1, st2) -> Bool in
    return st1.id < st2.id
}

//sort by name
let r3 = students.sorted { $0.name < $1.name }
r3
