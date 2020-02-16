//
//  DBManager.swift
//  PasswordManager
//
//  Created by Teacher on 16/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation
import RealmSwift

final class DBManager {
    static let manager = DBManager()
    
    private var realm : Realm
    
    private init() {
        self.realm = try! Realm()
    }
    
    //add an object to the database
    //Object is base class for Realm's Classes
    func add(object : Object) {
        do {
            try realm.write {
                self.realm.add(object)
            }
        } catch {
            print(error)
        }
    }
    
    func remove(object : Object) {
        do {
            try realm.write{
                self.realm.delete(object)
            }
        } catch {
            print(error)
        }
    }
//
//    func getAllPasswordItems() -> Results<PasswordItem> {
//        return realm.objects(PasswordItem.self).sorted(byKeyPath: "title")
//    }
    
    func getObjects<T : Object>(sort : String) -> Results<T> {
        return realm.objects(T.self).sorted(byKeyPath: sort)
    }
}
