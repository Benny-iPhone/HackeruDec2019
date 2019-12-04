import UIKit

let arr : [Int] = (0...1000).compactMap{ $0}

var myArray : [Int] = []
for i in 0...1000{
    myArray.append(i)
}

//let sumAll = arr.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)

let sumAll = arr.reduce(0) { $0 + $1 }

sumAll

let sumDivideBy3 = arr.reduce(0) { $1 % 3 == 0 ? $0 : ($0 + $1) }
sumDivideBy3

struct Product{
    let name : String
    let price : Double
}

let cart = [
    Product(name: "Coca Cola",price: 3.5),
    Product(name: "Bamba",price: 4),
    Product(name: "Loyalty" ,price: -1)
]

let total = cart.reduce(Double(0)) { (tempTotal, product) -> Double in
    return tempTotal + product.price
}

let swiftTotal = cart.reduce(0.0) { $0 + $1.price }
//cart.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Product) throws -> Result##(Result, Product) throws -> Result#>)
var sum : Double = 0
for p in cart{
    sum += p.price
}























