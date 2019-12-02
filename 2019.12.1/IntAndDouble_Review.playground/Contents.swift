import UIKit

var num1 = 1 //Int
var num2 : Int = 2

num1 += num2

let num3 = num1 + num2
//num3 += num3 //wrong, num3 is let

let num4 : Int8 = 0 //-128...127
let num5 : UInt8 = 3 //0...255
let num6 : UInt8 = 5
//let uint8Result = num5 - num6 //error: negative value

let num7 = 1 //00...0001
let num8 = 2 //00...0010
            // 00...0011
num7 | num8
num7 & num8

let r = num1 + Int(num5) + Int(num1)


let d1 = 3.5 //Double
let d2 : Double = 4

let f1 : Float = -1








