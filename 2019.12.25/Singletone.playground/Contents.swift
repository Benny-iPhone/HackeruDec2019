import UIKit

//Shared Instance
class User {
    static let current : User = User(id: "0", username: "me")
    
    //some properties
    let id : String
    let username : String
    
    init(id : String, username : String){
        self.id = id
        self.username = username
    }
}

let user1 = User(id: "123", username: "mac_user")

User.current.id

//Singletone

class Database {
    //static var myDatabase : Database?
    static let database = Database()
    static let backupDatabase = Database()
    
    private let path : String
    
    private init(){
        self.path = "/database.sqlite"
    }
    
    func openConnection() {
        
    }
}

Database.database.openConnection()
//let otherDB = Database()
//otherDB.openConnection()
//Utils.swift

Database.database.openConnection()
let db1 = Database() //forbidden
