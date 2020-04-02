https://www.raywenderlich.com/762435-swift-interview-questions-and-answers

//2

import UIKit

var view1 = UIView()
view1.alpha = 0.5

let view2 = UIView()
view2.alpha = 0.5 // Will this line compile?

//3

var animals = ["fish", "cat", "chicken", "dog"]
animals.sort { (one: String, two: String) -> Bool in
    return one < two
}
print(animals)

//solutions
var animals = ["fish", "cat", "chicken", "dog"]
animals.sort{ $0 < $1 } //option 1
animals.sort(<) //option 2

print(animals)

//4

class Address {
  var fullAddress: String
  var city: String

  init(fullAddress: String, city: String) {
    self.fullAddress = fullAddress
    self.city = city
  }
}

class Person {
  var name: String
  var address: Address

  init(name: String, address: Address) {
    self.name = name
    self.address = address
  }
}

var headquarters = Address(fullAddress: "123 Tutorial Street", city: "Appletown")
var ray = Person(name: "Ray", address: headquarters)
var brian = Person(name: "Brian", address: headquarters)

brian.address.fullAddress = "148 Tutorial Street"

print (ray.address.fullAddress)

//problem: ray.address Changed
//How to fix?
//Change Address from class to struct
//What if you can not?
//
var ray = Person(name: "Ray", address: Address(fullAddress: "123 Tutorial Street", city: "Appletown"))
var brian = Person(name: "Brian", address: Address(fullAddress: "123 Tutorial Street", city: "Appletown"))

//What if you are the coder of Person, and you can not predict how other people will use the class
//make a copy of address in Person's init

class Person {
  var name: String
  var address: Address

  init(name: String, address: Address) {
    self.name = name
    self.address = Address(fullAddress: address.fullAddress, city: address.city)
  }
}

//will this trigger a memory leak?
//no, no one retain the headquarters instance
