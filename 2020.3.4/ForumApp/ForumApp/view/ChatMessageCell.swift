//
//  ChatMessageCell.swift
//  ForumApp
//
//  Created by Teacher on 04/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    func populate(with message : ChatMessage) {
        nameLabel?.text = message.authorName
        messageLabel.text = message.text
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        timeLabel.text = formatter.string(from: message.date)
    }
    
}
