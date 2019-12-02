import Foundation

var str = "Hello, playground"
//str
str = "Hello, Swift"
str += "😀💩"
//str = 3

print(str)

//Why will the application crash? (in 1 of 2 cases avg.)
//let randomNumber = Int64(arc4random())

var num1 = 3
var num2 = 4
print(num1 + num2)
print("num1 + num2 = \(num1 + num2)")
print("7 * 5 = \(7 * 5) isn't that \"cool\" \\?")

var num3 : Int = 5
print(num3)
num3 += 1
print(num3)

//Int8 => -128...127 => -2^(b-1) ... 2^(b-1) - 1
//UInt8 => 0...255 => 0...2^b-1
//Int32 - like 'c' int
//Int64 like 'c' long
//Default for Int is depend on system, if 32bit then Int32, if  64 bit then Int64.
//32 bit - up to iPhone 5c
//64 bit - starting with iPhone 5s

var n = 1 //Int
n += 3
n -= 10
print(n)
//n = 3.5 //Error!
//n = "hi" //Error!

var un : UInt = 1
//un = -1 //Error!

let constNum = 1
//constNum = 2 //Error!
print(n + constNum)
print(n - constNum)
print(n * constNum)

let val1 = 6
let val2 = 4
print(val1 / val2)

var s1 = val1 / val2






