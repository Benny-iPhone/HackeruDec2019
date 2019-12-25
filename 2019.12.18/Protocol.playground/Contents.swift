import UIKit

protocol Displayable {
    var title : String { get }
}

struct Person : Displayable {
    var firstName : String
    var lastName : String
    
    var title: String{
        return firstName + " " + lastName
    }
}

var p = Person(firstName: "Misha", lastName: "Kagan")
p.title

struct Product : Displayable {
    var title : String
}

let product = Product(title: "Coffee")

enum Direction{
    case up, down, left, right
}

extension Direction : Displayable {
    var title: String{
        return "\(self)"
    }
}

struct UILogic {
    let items : [Displayable]
}

let logic = UILogic(items: [p,product,Direction.up])
logic.items.forEach{ print($0.title) }

extension Displayable{
    func doSomething(){
        print(#function)
    }
}

Direction.down.doSomething()
