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
    
    let id : String
    let title : String
    let owner : String
    let ownerName : String
    let createdAt : Date
    
    init(title : String, uid : String, uname : String) {
        //UUID - Universal Unique IDentifier
        self.id = UUID().uuidString
        self.title = title
        self.owner = uid
        self.ownerName = uname
        self.createdAt = Date() //new date is now
    }
    
    init?(_ dict : [String:Any]) {
        guard let id = dict["id"] as? String,
            let title = dict["title"] as? String,
            let owner = dict["owner"] as? String,
            let ownerName = dict["ownerName"] as? String,
            let createdAt = dict["createdAt"] as? TimeInterval else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.owner = owner
        self.ownerName = ownerName
        self.createdAt = Date(timeIntervalSince1970: createdAt)
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
    
}
