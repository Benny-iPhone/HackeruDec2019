import UIKit


func doSomething(number : Int) {
    
}

doSomething(number: 3)

func forEachSumArray(arr : [Int]) -> Int {
    var sum = 0
    for num in arr {
        sum += num
    }
    
    return sum
}

func iterateByIndexSumArray(arr : [Int]) -> Int {
    //for i in 0...(arr.count - 1)
    var sum = 0
    for i in 0..<arr.count {
        sum += arr[i]
    }
    return sum
}

func swiftySumArray(arr : [Int]) -> Int {
    //0 - initial value
    //$0 - sum so far
    //$1 - current element in array
    return arr.reduce(0) { $0 + $1}
}

let myArray = [4,5,6]
forEachSumArray(arr: myArray)


struct Lotto {
    
    var minNumber : Int
    var maxNumber : Int
    var numbersCount : Int
    
    func generateNumbers() -> [Int] {
//        var pool : [Int] = []
//        for i in minNumber...maxNumber {
//            pool.append(i)
//        }
        
        //create an array of Int
        var pool = (minNumber...maxNumber).compactMap{ $0 }
        //random
        pool.shuffle()
        //pool[0..<numbersCount] => ArraySlice
        return Array(pool[0..<numbersCount])
    }
    
}

let userInput = [2,4,10,12,14]

let lotto = Lotto(minNumber: 1, maxNumber: 30, numbersCount: 5)
let result = lotto.generateNumbers()

result.contains(userInput[0])

var correntCount = 0
for i in 0..<userInput.count {
    if result.contains(userInput[i]) {
        correntCount += 1
    }
}

print(correntCount)

let total = userInput.reduce(0) { $0 + (result.contains($1) ? 1 : 0) }
print(total)


















