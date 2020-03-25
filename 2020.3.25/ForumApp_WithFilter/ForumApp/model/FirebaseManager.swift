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
import FirebaseStorage

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
    
    func getStorageRefence(for room : Chatroom) -> StorageReference {
        let filename = room.id + ".jpeg"
        return Storage.storage().reference().child("chatrooms").child(filename)
    }
    
    func createChatroom(with title : String,
                        image : UIImage?,
                        completion : @escaping (Bool)->Void) {
        
        guard let uid = self.userId,
            let uname = self.userName else {
                completion(false)
                return
        }
        
        let chatroom = Chatroom(title: title, uid: uid, uname: uname)
        let json = chatroom.dictionaryRepresentation
        chatroomsDatabaseReference.child(chatroom.id).setValue(json) { (error, ref) in
            if let error = error {
                print(error)
                completion(false)
                return
            }
            
            guard let image = image,
                let data = image.jpegData(compressionQuality: 0.7) else {
                    completion(true)
                    return
            }
            
            let filename = chatroom.id + ".jpeg"
            let storageRef = Storage.storage().reference().child("chatrooms").child(filename)
            storageRef.putData(data, metadata: nil) { (metadata, uploadError) in
                if let uploadError = uploadError {
                    //even if upload failed, we consider the action to be successful, beacause image is optional
                    print(uploadError)
                }
                
                completion(true)
            }
            
        }
    }
    
    func deleteChatroom(_ chatroom : Chatroom) {
        chatroomsDatabaseReference.child(chatroom.id).setValue(nil)
        //chatroomsDatabaseReference.child(chatroom.id).removeValue()
    }
    
    func getAllChatrooms(filter : String?, with completion : @escaping ([Chatroom])->Void) {
        
        func resultHandler(_ snapshot : DataSnapshot) {
            guard let json = snapshot.value as? [String:Any] else {
                completion([])
                return
            }
            
            let result : [Chatroom] = Array(json.values).compactMap{ $0 as? [String:Any]}.compactMap{ Chatroom($0) }
            completion(result)
        }
        
        if let filter = filter, filter.count > 0 {
            let query = chatroomsDatabaseReference.queryOrdered(byChild: "title").queryStarting(atValue: filter, childKey: "title")
            //queryEqual(toValue: filter, childKey: "title")
            query.observeSingleEvent(of: .value, with: resultHandler(_:))
        } else {
            chatroomsDatabaseReference.observeSingleEvent(of: .value, with: resultHandler(_:))
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


