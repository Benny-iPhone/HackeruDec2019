//
//  OrangeView.swift
//  SubClassView
//
//  Created by Teacher on 05/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class OrangeView: UIView {

    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //from storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .systemOrange
    }

}
