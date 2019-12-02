import UIKit

/*
 sum digit
 */

var number = 34_567
//var sum1 = String(number).compactMap{ $0.wholeNumberValue}.reduce(0, +)

var sum = 0
while number != 0 {
    sum += number % 10
    number /= 10
}

print(sum)

//let arr : [Any] = [1,2,[3],[[4]],[5,6],"[4]"]

//[1,2,3,4,5,6,"[4]"]

/*
 max value in array
 */

let q2Array = [-10_000,5000,1,2,3,-50,999,1040,7]

var maxVal = q2Array[0]//Int.min
for value in q2Array{
    maxVal = max(maxVal, value)
}

print(maxVal)

//for i in 0..<q2Array.count{
//
//}


//    if value > maxVal{
//        maxVal = value
//    }

/*
array values not unique
 */

func q3Solution(arr : [Int]) -> Bool{
    if arr.isEmpty{ return false }
    let sortedArray = arr.sorted()
    print(sortedArray)
    for i in 0..<sortedArray.count-1{
        if sortedArray[i] == sortedArray[i+1]{
            return true
        }
        
    }
    
    return false
}

print(q3Solution(arr: [1,2,3,7,999,-50,50,2]))
q3Solution(arr: [1,-1])
q3Solution(arr: [])




