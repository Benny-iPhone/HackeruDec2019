import UIKit

var arr1 = [1,2,3]
var arr2 : [Int] = [4,5,6]
var arr3 : Array<Int> = [7,8,9]

var stringsArray : [String] = [
    "hello",
    "world"
]

let stringsArray2 = ["a","bc","d","efg"]

let doublesArray = [Double.greatestFiniteMagnitude,Double.pi,100.9]

var mixedArray : [Any] = [1,2,3.0,"hi",doublesArray,UILabel()]
let viewsArray = [UILabel(),UIButton()] //[UIView]

var arr4 : [Int] = []
var arr5 = [Int]()

let arr6 = [Int](repeating: -3, count: 100)

struct Student{
    var name : String = ""
    var id : String = ""
}

let ccclass = [Student](repeating: Student(), count: 30)

//let n = Int()
//let n = 0

//read

let intVal = arr1[0] //intVal is Int
print(intVal)
//arr1[15] // Error
arr4.first //arr4[0]
arr4.last

print(arr1.count)
arr1.append(7)
print(arr1.count)

arr1.isEmpty
arr4.isEmpty

arr1[1] = -5
print(arr1)

arr2 += arr3
print(arr2)

//arr3 += doublesArray

var arr8 = doublesArray + arr2.compactMap{ Double($0)}
mixedArray += doublesArray

var array : [Int] = []
array.append(1)
array += [2]
array += [13,4,5,6,7]
array.insert(-4, at: 0)
array[0] = -5

let removedValue = array.remove(at: 3)
array

let subArray = array[1...3]
array[1...3] = [0,0,0]
array

array[1...3] = [9,9,9,9]
array

array[0...4] = []
array

array[0...0] = [-6,-6,-6]
array
