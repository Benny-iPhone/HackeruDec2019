import UIKit

var num1 = 3 //Int
var num2 : Int = 3 //mutable
num2 += 1
let num3 : Int = 5 //const

/*
 Double (64 bit), Float (32 bit)
 */

let d1 = 6.0 //default is Double
let d2 : Double = 4.14
print(d1 + d2)
let dSum1 = d1 + d2
let dDiv1 = d1 / d2
print(dDiv1)

let f1 : Float = -1.5

/*
 Combining Type
 */

let intNum = 4 //Int
let doubleVal = 3.0 //Double
//let intDoubleVal = Int(doubleVal)
let intResult = intNum * Int(doubleVal)
let doubleResult = Double(intNum) * doubleVal

let divDoubleResult = Double(intNum) / doubleVal
print(divDoubleResult)

let divIntResult = intNum / Int(doubleVal)
print(divIntResult)

/*
 Sum number between 1 to 100
 */
var sum = 0
for i in 1..<100{ /*1...100*/
    sum += i
}

print(sum)
/*
 Count how many numbers divide by 3 in range 1...102
 */

var count = 0
for i in 1...102{
    if i % 3 == 0{
        count += 1
    }
}

print(count)

let r = (1...102).filter{ $0 % 3 == 0}.count

func filterFunc(_ number : Int) -> Bool{
    return number % 3 == 0
}

(1...10).filter(filterFunc)
let arr = (1...10).filter { (number) -> Bool in
    return number % 3 == 0
}

print(arr)

(1...10).filter { $0 % 3 == 0 }.count

print((1...100).sorted { $0 > $1 })
(1...100).sorted(by: >)

print(r)

var array : [Int] = [] //[Int]()
array.append(1)

/*
 Create an array containing all number between 1 to 100 that have the digit 7
 
 if aaaa && bbbb
 */

var resultArray : [Int] = []

for i in 1...100{
    if i % 10 == 7 || i / 10 == 7{
        resultArray.append(i)
    }
}
print(resultArray)

//10_000

//100_000
