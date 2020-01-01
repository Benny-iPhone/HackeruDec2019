//
//  ProfilePicImageView.swift
//  ProfilePicture
//
//  Created by Teacher on 01/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

@IBDesignable class ProfilePicImageView: UIImageView {

    private func setup() {
        self.layer.cornerRadius = min(self.bounds.width, self.bounds.height) / 2
        self.layer.masksToBounds = true
    }
    
    //constraints took place
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

}
