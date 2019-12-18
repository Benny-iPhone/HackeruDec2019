import UIKit

func doNothing(){
    
}

doNothing()

func giveMeString() -> String {
    return "Hello"
}

let str = giveMeString()

func sayHello(to person : String) -> String {
    return ["Hello",person].joined(separator: " ")
}

sayHello(to: "Amnon")
sayHello(to: "Yuval")

func greeting(firstName : String?, lastName : String?) -> String {
    //return ["Hello",firstName,lastName].compactMap{ $0}.joined(separator: " ")
    
    var arr : [String] = ["Hello"]
    if let firstName = firstName{
        arr.append(firstName)
    }
    
    if let lastName = lastName{
        arr.append(lastName)
    }
    
    return arr.joined(separator: " ")
}

greeting(firstName: "Aria", lastName: "Stark")
greeting(firstName: "Hodor", lastName: nil)


//Write a function that receive 3 Double and return Bool
//true if they can represent right triangle (a^2 + b^2 == c^2)
//pow(a,2)
func isPita(a : Double, b : Double, c : Double) -> Bool{
    return pow(a, 2) + pow(b, 2) == pow(c, 2)
}

isPita(a: 0, b: 0, c: 0)
isPita(a: 1, b: 1, c: 1)
isPita(a: 3, b: 4, c: 5)

//no external name
func multi(_ a : Double, _ b : Double) -> Double{
    return a * b
}

multi(3.5, 2)

//inifinite arguments
func sum(numbers : Int...) -> Int{
    return numbers.reduce(0) { $0 + $1}
}

sum(numbers: 1,2,3,4)
let red = 50
let green = 255
let blue = 0
let hexString = String(format:"RGB: %02X,%02X,%02X", red,green,blue)
//String(format: <#T##String#>, <#T##arguments: CVarArg...##CVarArg#>)
//NSPredicate(format: "self.index > %@ AND self.priority = %@", 50,3)

//inout

var num1 = 3.0
var num2 = 4.5

multi(num1, num2)

func mySwap(n1 : inout Int, n2 : inout Int) {
    let temp = n1
    n1 = n2
    n2 = temp
}

var number1 = -6
var number2 = 30

mySwap(n1: &number1, n2: &number2)
number1
number2

//return more than 1 argument

func getCard() -> (kind: String, value: Int) {
    return ("Heart",10)
}

let card = getCard()

card.0
card.kind

card.1
card.value

//receive function

typealias Day = Int

let d : Day = 1

typealias OperationFunction = (Int,Int)->Int

func doOperation(n1 : Int, n2 : Int, function: OperationFunction) -> Int {
    return function(n1,n2)
}

doOperation(n1: 5, n2: 4, function: +)

let label = UILabel()
func fadeOut(){
    label.alpha = 0
}
let myFunction : ()->Void = fadeOut

UIView.animate(withDuration: 1.5, animations: fadeOut)


//return function












