//
//  UIView+Border.swift
//  Border
//
//  Created by Teacher on 01/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var borderColor : UIColor {
        get {
            if let cgColor = self.layer.borderColor {
                return UIColor(cgColor: cgColor)
            } else {
                return UIColor.black
            }
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
}

