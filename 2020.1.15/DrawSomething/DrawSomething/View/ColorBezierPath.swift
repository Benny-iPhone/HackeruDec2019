//
//  ColorBezierPath.swift
//  DrawSomething
//
//  Created by Teacher on 15/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ColorBezierPath: UIBezierPath {
    
    var strokeColor : UIColor?
//    var fillColor : UIColor?
//
//    override func fill() {
//        if let fillColor = self.fillColor {
//            fillColor.setFill()
//        }
//        super.fill()
//    }
    
    override func stroke() {
        if let strokeColor = self.strokeColor {
            strokeColor.setStroke()
        }
        
        super.stroke()
    }

}
