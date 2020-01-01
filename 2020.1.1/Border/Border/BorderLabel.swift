//
//  BorderLabel.swift
//  Border
//
//  Created by Teacher on 01/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class BorderLabel: UILabel {

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.masksToBounds = true
        self.font = .boldSystemFont(ofSize: 24)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
