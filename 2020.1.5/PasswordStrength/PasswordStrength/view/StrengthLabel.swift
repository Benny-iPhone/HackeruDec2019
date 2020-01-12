//
//  StrengthLabel.swift
//  PasswordStrength
//
//  Created by Teacher on 05/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class StrengthLabel: UILabel {

    func show(strength : Strength) {
        
        switch strength {
        case .poor:
            self.backgroundColor = .red
            self.textColor = .white
            self.text = "POOR 👎"
        case .meduim:
            self.backgroundColor = .darkGray
            self.textColor = .white
            self.text = "MEDUIM"
        case .strong:
            self.backgroundColor = .blue
            self.textColor = .white
            self.text = "GOOD 👍"
        }
        
    }

}
