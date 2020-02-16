//
//  ItemCell.swift
//  PasswordManager
//
//  Created by Teacher on 16/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var identityLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    func populate(with item : PasswordItem) {
        titleLabel.text = item.title
        identityLabel.text = item.identity
        passwordLabel.text = item.password
    }
    
}
