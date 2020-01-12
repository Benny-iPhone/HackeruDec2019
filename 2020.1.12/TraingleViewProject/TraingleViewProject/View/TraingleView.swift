//
//  TraingleView.swift
//  TraingleViewProject
//
//  Created by Teacher on 12/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

@IBDesignable class TraingleView: UIView {

    @IBInspectable var strokeColor : UIColor = .black
    @IBInspectable var fillColor : UIColor = .clear
    
    @IBInspectable var lineWidth : CGFloat = 1 {
        didSet { //observe when value changed
            //de-draw
            self.setNeedsDisplay()
            
            print("value changed from \(oldValue) to \(lineWidth)")
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let w = self.bounds.width
        let h = self.bounds.height
        
        context.move(to: CGPoint(x: w * 0.5, y: h * 0.1))
        context.addLine(to: CGPoint(x: w * 0.1, y: h * 0.9))
        context.addLine(to: CGPoint(x: w * 0.9, y: h * 0.9))
        context.closePath()
        
        context.setLineWidth(max(1,self.lineWidth))
        
        //option 1:
        //context.setStrokeColor(self.strokeColor.cgColor)
        //option 2:
        self.strokeColor.setStroke()
        
        //context.strokePath()
        
        self.fillColor.setFill()
        //context.fillPath()
        
        //alternative to context.strokePath() & context.fillPath()
        context.drawPath(using: .fillStroke)
        
    }
    

}
















