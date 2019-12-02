import UIKit

//"abc\r\nasdad".components(separatedBy: "\r").joined()

var array = "a,bbbb,c,d,e,f,g,h,i,j,k,1,2,3,I".components(separatedBy: ",")

array.filter { (ch) -> Bool in
    switch ch {
    case "a","e","i","o","u":
        return true
    case "A","E","I","O","U":
        return true
    default:
        return false
    }
}

let digits = (0...9).compactMap{String($0)}
let result = array.filter{ digits.contains($0) }
result

Int("hello")
Int("1")

let result1 = array.compactMap{ Int($0)}
result1

[1,2,3].compactMap{ $0 * 2}

let intArray = [10,20,30]
let doubleArray = [1.0,2.0,3.0]

let sumArray = intArray + doubleArray.compactMap{ Int($0)}
sumArray

//array
/*
struct Card{
    let value : Int
    let type : String
}

"3-L,4-H"
*/

struct Student{
    let gradle : Double
}

let students = [100,19,40,7,38,96,80,56].compactMap{ Student(gradle: $0)}

let over80Students = students.filter{ $0.gradle >= 80 }

struct Person{
    let name : String
    let age : Int
}

let people = [
    ("Moshiko",28),
    ("Ziko",35),
    ("Amnon",19)
    ].compactMap{ Person(name: $0.0, age: $0.1)}
people.filter{ $0.age > 20}

let touple = (name: "string", age: 12, present: true)
touple.1
touple.age
