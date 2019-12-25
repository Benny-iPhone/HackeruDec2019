import UIKit

class Person {
    var name = ""
}

struct Student {
    var alias = ""
}

let p0 = Person()
let s0 = Student()
p0.name = "a"
//s0.alias = "b" //error, s0 is immutable

//p0 = Person() //error, p0 is immutable

var p1 = Person()
var s1 = Student()

p1.name = "b"
s1.alias = "b"

var p2 = p1 //copy pointer, both p1 and p2 pointing to the same place in the memorty (Heap)
var s2 = s1 //copy value, there are 2 Students in the memory (Stack)

p2.name = "c"
s2.alias = "c"

p1.name
s1.alias

let arr1 = [Person(),Person()]
let arr2 = [Student(),Student()]

var p = arr1[0]
p.name = "d"
var s = arr2[0]
s.alias = "d"

arr1[0].name
arr2[0].alias


func myFunc2() -> Int {
    sleep(3)
    return 3
}

func myFunc1(){
    let num = 2
    let otherNum = myFunc2()
    print(num)
}

myFunc1()

class Dog {
    var brother : Dog?
}

let d1 = Dog()
let d2 = Dog()

d1.brother = d2
d2.brother = d1
