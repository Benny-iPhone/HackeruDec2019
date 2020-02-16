//
//  PasswordItem.swift
//  PasswordManager
//
//  Created by Teacher on 16/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation
import RealmSwift

class PasswordItem : Object {
    @objc dynamic var title : String? = nil
    @objc dynamic var identity : String? = nil
    @objc dynamic var password : String? = nil
}
