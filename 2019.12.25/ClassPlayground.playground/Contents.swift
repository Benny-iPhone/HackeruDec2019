import UIKit

enum Suit{
    case heart, spade, club, diamond
}

/*
class Card{
    let faceValue : Int = 0
    let suit : Suit = .club
}

Card()
*/

class Card{
    let faceValue : Int
    let suit : Suit
    
    var limitedBy10FaceValue : Int{
        return min(self.faceValue, 10)
    }
    
    init(faceValue : Int = 1, suit : Suit = .club){
        self.faceValue = faceValue
        self.suit = suit
    }
    /*
    init(){
        self.faceValue = 1
        self.suit = .diamond
    }*/
    
    func isPair(with card : Card) -> Bool {
        return self.faceValue == card.faceValue
    }
    
    //overrideable
    class func getRoyalFlash() -> [Card] {
        return [10,11,12,13,1].compactMap{ Card(faceValue: $0, suit: .heart)}
    }
    //can not be override when using the keyword 'static'
    static func getRoyalFlash2() -> [Card] {
        return [10,11,12,13,1].compactMap{ Card(faceValue: $0, suit: .heart)}
    }
}

Card.getRoyalFlash()

let card1 = Card()
card1.limitedBy10FaceValue
let card2 = Card(faceValue: 2, suit: .heart)
let card3 = Card(faceValue: 1, suit: .club)
let card4 = Card(faceValue: 3)
let card5 = Card(suit: .club)

print(card1.isPair(with: card2))
print(card1.isPair(with: card3))

func myPow(_ n1 : Double, _ n2 : Double = 2) -> Double {
    return pow(n1, n2)
}

myPow(3)
myPow(3, 2)

class Person {
    var firstName : String
    var middleName : String?
    var lastName : String
    let date : Date
    
    var age : Int {
        
        return Calendar(identifier: .gregorian).dateComponents([.year], from: date, to: Date()).year!
        
    }
    
    init(firstName : String, lastName : String){
        self.firstName = firstName
        self.lastName = lastName
        self.date = Date(timeIntervalSince1970: 0) //seconds
    }
}

let p1 = Person(firstName: "John", lastName: "Doe")
print(p1.age)
//class instances are pointers, so properties can be set even when using let
p1.middleName = "Arthur"

let now = Date()
let someDate = Date(timeIntervalSince1970: 1577294818)

now.timeIntervalSince1970



















