//
//  FirebaseManager.swift
//  ForumApp
//
//  Created by Teacher on 01/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class FirebaseManager {
    static let manager = FirebaseManager()
    var userId : String? {
        return Auth.auth().currentUser?.uid
    }
    
    var userName : String? {
        return Auth.auth().currentUser?.displayName
    }
    
    private lazy var chatroomsDatabaseReference : DatabaseReference = {
        return Database.database().reference().child("Chatrooms")
    }()
    
    private lazy var messagesDatabaseReference : DatabaseReference = {
        return Database.database().reference().child("Messages")
    }()
    
    func createChatroom(with title : String) {
        guard let uid = self.userId,
            let uname = self.userName else {
                return
        }
        
        let chatroom = Chatroom(title: title, uid: uid, uname: uname)
        chatroomsDatabaseReference.child(chatroom.id).setValue(chatroom.dictionaryRepresentation)
    }
    
    func deleteChatroom(_ chatroom : Chatroom) {
        chatroomsDatabaseReference.child(chatroom.id).setValue(nil)
        //chatroomsDatabaseReference.child(chatroom.id).removeValue()
    }
    
    func getAllChatrooms(with completion : @escaping ([Chatroom])->Void) {
        chatroomsDatabaseReference.observeSingleEvent(of: .value) { (snapshot) in
            guard let json = snapshot.value as? [String:Any] else {
                completion([])
                return
            }
            
            let result : [Chatroom] = Array(json.values).compactMap{ $0 as? [String:Any]}.compactMap{ Chatroom($0) }
            completion(result)
        }
    }
    
    func createMessage(with text : String, in room : Chatroom) {
        guard let uid = self.userId,
            let uname = self.userName else {
                return
        }
        //create object
        let msg = ChatMessage(roomId: room.id,
                              authorId: uid,
                              authorName: uname,
                              text: text)
        //write to db
        let json = msg.dictionaryRepresentation
        messagesDatabaseReference.child(room.id).child(msg.id).setValue(json)
        
    }
    
    func stopListen(to room : Chatroom) {
        messagesDatabaseReference.child(room.id).removeAllObservers()
    }
    
    @discardableResult
    func listenToNewMessage(in room : Chatroom,
                            with callback : @escaping (ChatMessage)->Void) -> UInt{
        
        //reference to a specific room's messages, ordered by date
        let ref = messagesDatabaseReference.child(room.id).queryOrdered(byChild: "date")
        //let's listen
        return ref.observe(.childAdded) { (snapshot) in
            guard let json = snapshot.value as? [String:Any] else {
                return
            }
            
            guard let msg = ChatMessage(json) else {
                return
            }
            
            callback(msg)
        }
        
    }
}


