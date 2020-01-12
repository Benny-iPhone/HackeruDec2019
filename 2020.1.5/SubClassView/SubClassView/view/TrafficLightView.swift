//
//  TrafficLightView.swift
//  SubClassView
//
//  Created by Teacher on 05/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class TrafficLightView: UIView {

    enum Color : Int {
        case red = 100 , orange, green
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        if let color = Color(rawValue: self.tag) {
            switch color {
            case .red: self.backgroundColor = .systemRed
            case .green: self.backgroundColor = .systemGreen
            case .orange: self.backgroundColor = .systemOrange
            }
        }
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }

}
