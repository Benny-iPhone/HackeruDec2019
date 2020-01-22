//
//  BoldLabel.swift
//  LabelProject
//
//  Created by Teacher on 22/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class BoldLabel: UILabel {

    //progomatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    //used by storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
    }
    
    private func style() {
        self.textColor = .red
        self.font = UIFont.boldSystemFont(ofSize: 30)
    }
}
