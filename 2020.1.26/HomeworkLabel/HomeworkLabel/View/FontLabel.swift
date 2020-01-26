//
//  FontLabel.swift
//  HomeworkLabel
//
//  Created by Teacher on 26/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class FontLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    private func setupGesture() {
        self.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        self.addGestureRecognizer(tapGesture)
    }

    @objc func tapAction(_ sender : Any) {
        increaseFont()
    }
    
    func increaseFont() {
        self.font = self.font.withSize(self.font.pointSize + 1)
        //self.font = UIFont(name: self.font.fontName, size: self.font.pointSize + 1)
    }

}
