import UIKit

//$0 - first argument in a function
//$1 - second argument in a function
//$2 - third argument in a function
//$3 - forth argument in a function
//$4 - fifth argument in a function
//$n - n-th argument in a function (where n∈N)

//anonymus fuctions, where arguments pre-declared, an no name was given

let url = URL(string: "https://www.google.com")!
//URLSession.shared.dataTask(with: url, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)

URLSession.shared.dataTask(with: url) { (data, response, error) in
    //some code
}

URLSession.shared.dataTask(with: url) {
    if $2 != nil {
        print("error")
        return
    }
    print("success")
    print($0)
    print($1)
}

//let view = UIView(frame: .zero)

//view.constraints.filter(<#T##isIncluded: (NSLayoutConstraint) throws -> Bool##(NSLayoutConstraint) throws -> Bool#>)

let intArray = [7,5,17,14,36,220,770,-22,Int.min]

let allZugiim = intArray.filter { (num) -> Bool in
    return num % 2 == 0
}
/*
intArray.filter { (<#Int#>) -> Bool in
    <#code#>
}*/
let allZugiim2 = intArray.filter { $0 % 2 == 0 }

let dividedBySix = intArray.filter{ $0 % 2 == 0}.filter{ $0 % 3 == 0}

intArray.filter{ $0 % 2 == 0}.filter{ $0 % 3 == 0}.forEach { print($0) }

//let firstNegatvie = intArray.first(where: <#T##(Int) throws -> Bool#>)
let firstNegatvie = intArray.first { (num) -> Bool in
    return num < 0
}

let firstNegatvie2 = intArray.first{ $0 < 0 }

let lastPositive = intArray.last { $0 > 0 }

let dummyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

let stringsArray = dummyText.components(separatedBy: " ")
let firstWordStartsWith_s = stringsArray.first { $0.hasPrefix("s") }

let string = "1,2,3,4,5,6,a,b,c,7"
let arr : [String] = string.components(separatedBy: ",")

arr.compactMap { (s) -> Int? in
    return Int(s)
}

arr.compactMap{ Int($0) }

//print 32 in base 2 (binary)
print(String(32,radix: 2))

//Array((1...100))
//let numbersFrom1to100 = (1...100).compactMap{ $0 }.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)

let numbersFrom1to100 : [Int] = (1...100).compactMap{ $0 }

let r1 = numbersFrom1to100.reduce(-100.0) { (tempSum : Double, currentValue : Int) -> Double in
    
    //return tempSum + (currentValue % 3 == 0 ? Double(currentValue) : 0)
    
    if currentValue % 3 == 0 {
        return tempSum + Double(currentValue)
    } else {
        return tempSum
    }
}

let r2 = numbersFrom1to100.reduce(-100) {
    $0 + ($1 % 3 == 0 ? Double($1) : 0 )
}

