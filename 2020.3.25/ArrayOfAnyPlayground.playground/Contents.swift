import UIKit

var str = "Hello, playground"

var intArray : [Int] = [1,2,3]
intArray.append(4)
intArray += [5,6]
intArray.remove(at: 2)

var viewsArray = [UILabel(),UIImageView()]

let someView = UIView()
someView.subviews //array of UIView

enum Direction {
    case left, right
}

struct Dog {
    let name : String
    
    func bark() {
        print("barking")
    }
}

class Person {
    
}

var miscArray : [Any] = [Person(),Direction.left,Dog(name: "Roger")]

miscArray.append(5)

miscArray += [4.5,UIView(),viewsArray,intArray]

let someNumber = intArray[4]
//someNumber is Int

let anObject = miscArray[2]
//anObject is Any

if let dog = miscArray[2] as? Dog {
    dog.bark()
} else {
    print("not a god")
}

func flatArray(_ arr : [Any]) -> [Any] {
    var resultArray : [Any] = []
    for item in arr {
        if let subArray = item as? [Any] {
            resultArray += flatArray(subArray)
        } else {
            resultArray.append(item)
        }
    }
    
    return resultArray
}

let sampleArray : [Any] = [1,2,3,[4,5],"[6],7",8.9,[[[[9,[10],11.0]]]]]
//[1,2,3,4,5,"6,7",9,10]
//[[[[9,[10],11.0]]]] => [[[9,[10],11.0]]] => [[9,[10],11.0]] => [9,[10],11.0] => 9,[10],11.0 => 9,10,11.0

flatArray(sampleArray)

//flatArray([1,[4,5]]) =  flatArray([1]) + flatArray([4,5])


















