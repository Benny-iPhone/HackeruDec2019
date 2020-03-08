//
//  RoomCell.swift
//  ForumApp
//
//  Created by Teacher on 08/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import FirebaseUI

class RoomCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    
    func populate(with room : Chatroom) {
        nameLabel.text = room.title
        ownerLabel.text = "Created By " + room.ownerName
        
        //image view cleanup
        avatarImageView.image = nil
        avatarImageView.sd_cancelCurrentImageLoad()
        
        //load from storage
        let ref = FirebaseManager.manager.getStorageRefence(for: room)
        avatarImageView.sd_setImage(with: ref)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
