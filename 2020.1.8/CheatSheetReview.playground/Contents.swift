import UIKit

var httpError = (code: 503, reason: "Server Error")
httpError.code = 405
let (code, reason) = httpError

code
reason

httpError.0
httpError.code

let (_ , justReason) = httpError
justReason

typealias SomeTouple = (Int,String)
let arr : [SomeTouple] = []
let arr2 : [(Int,String)] = []

//optional

var num : Int? //nil

var myStr : String? // = nil
myStr = "hello"

myStr!.count //! force unwrapping, the developer tell to the compiler "this is not nil, treat that properly"

let optionalCount : Int? = myStr?.count
let count = myStr?.count ?? -1

// (boolean expression) ? result : fallback
// (optional value) ?? (alternative)

struct Item : Equatable{
    let id : String
    let name : String
    /*
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }*/
}

let arr3 : [Item] = [
    Item(id: "1", name: "item 1"),
    Item(id: "2", name: "item 2")
]

let it = Item(id: "1", name: "item 1")

it == arr3[1]

arr3.contains(it)

//Set
let arr55 = [1,2,2,3]
let set = Set(arr55)
arr55.count
set.count

var randomNumbers : [Int] = []
for _ in 1...100 {
    randomNumbers += [Int.random(in: 0...10)]
}

let randomSet = Set(randomNumbers)
randomSet.contains(2)

//functions

func sayHello(name : String) {
    print("hello " + name)
    print("hello \(name) ❤︎")
}

sayHello(name: "Class")

func sayHello(to name : String) {
    print("hello " + name)
    print("hello \(name) ❤︎")
}

sayHello(to: "Benny")

func sayHello(_ name : String) {
    print("hello " + name)
    print("hello \(name) ❤︎")
}

sayHello("asdasdads")

func sayHello2(to name : String, prefix : String = "") {
    print("Hello \(prefix) \(name)")
}

sayHello2(to: "Itzik", prefix: "Mr.")
sayHello2(to: "Itzik")


let adder : (Int,Int) -> Int = { $0 + $1 }

adder(4,5)

var myFunc = adder
myFunc = { $0 - $1 }

enum Currency : String {
    case dollar = "$"
    case nis = "₪"
    case euro = "€"
}

let c : Currency = .euro

print(c)

c.rawValue

let d : Currency? = Currency(rawValue: "$")

enum GameState {
    case inactive
    case playing(score : Int)
    case finished(score : Int, didWin : Bool)
}

var state1 : GameState = .inactive
let state2 = GameState.playing(score: 40)
state1 = .finished(score: 100, didWin: false)

switch state1 {
case .inactive:
    print("in active")
case .playing(let score):
    print("scored \(score)")
case .finished(_, let didWin):
    print(didWin)
}

func getData(with completion : @escaping (Result<[Int],Error>)->Void) {
    
    completion(.success([1,2,3]))
    
}

getData { (result) in
    switch result {
    case .failure(let error):
        print(error)
    case .success(let array):
        print(array)
    }
}

var someNum : Int?

switch someNum {
case .none:
    print("somenum is nil")
case .some(let value):
    print("value of somenum is \(value)")
}












