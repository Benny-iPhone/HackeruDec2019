import UIKit

//struct  - (data) structure
//class - תבנית נתונים

struct Car{
    let plateNumber : String
    let color : String
    
    func getUIColor() -> UIColor {
        return .red
    }
}

extension Car : Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.plateNumber == rhs.plateNumber
    }
}

//main usage for struct - represents data
//exeptction:  when inheritance in required

protocol Memel {
    var birthdate : Date { get }
}

extension Memel {
    var age : Int {
        return Calendar.current.component(.year, from: Date()) - Calendar.current.component(.year, from: self.birthdate)
    }
}

struct Dog : Memel {
    let birthdate: Date
    var race : String
}

struct Cat : Memel {
    let birthdate: Date
    let youtubeId : String
}

var d1 = Dog(birthdate: Date(timeIntervalSince1970: 0), race: "Amstaf2")
d1.age
var d2 = d1
d2.race = "abc" //not affecting d1, just like int
var num1 = 3
var num2 = num1
num2 = 4


let arr : [Memel] = [
    Dog(birthdate: Date(), race: "Amstaf"),
    Cat(birthdate: Date(timeIntervalSinceNow: -86400), youtubeId: "770")
]





//operation, shared instances, singletons, observers - use class
//inheritance, live in heap => exist outside of sepecific operation.

class DBManager {
    static let singleton = DBManager()
    
    var dbVersion : String { return "1.10" }
    
    func saveToDisk() {
        
    }
}

struct User : Codable{
    let id : String
}

class DataManager {
    static let shared = DataManager()
    
    var currentUser : User?
}

class Networking {
    
    static let shared = Networking()
    
    func ping() {
        
    }
    
}


class DataFetcher<T : Codable> {
    
    let networking : Networking
    
    init(networking : Networking = .shared) {
        self.networking = networking
    }
    
    func fetchUsers(callback : @escaping (Result<[T],Error>)->Void) {
        Networking.shared.ping()
    }
    
}

//ViewController

let fetcher = DataFetcher<User>()
fetcher.fetchUsers(callback: <#T##(Result<[User], Error>) -> Void#>)

//test
let n = Networking()
let testFetcher = DataFetcher<User>(networking: n)





