//
//  Chatroom.swift
//  ForumApp
//
//  Created by Teacher on 26/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation
import Firebase

struct Chatroom {
    
    static var databaseReference : DatabaseReference {
        return Database.database().reference().child("Chatrooms")
    }
    
    let id : String
    let title : String
    let owner : String
    let ownerName : String
    let createdAt : Date
    
    init?(title : String) {
        guard let user = Auth.auth().currentUser else {
            //can not create new Chatroom if not user is logged in
            return nil
        }
        //UUID - Universal Unique IDentifier
        self.id = UUID().uuidString
        self.title = title
        self.owner = user.uid
        self.ownerName = user.displayName ?? ""
        self.createdAt = Date() //new date is now
    }
    
    var dictionaryRepresentation : [String:Any] {
        return [
            "id":id,
            "title":title,
            "owner":owner,
            "ownerName":ownerName,
            "createdAt":createdAt.timeIntervalSince1970
        ]
    }
    
    func save() {
        Chatroom.databaseReference.child(self.id).setValue(self.dictionaryRepresentation)
    }
}
