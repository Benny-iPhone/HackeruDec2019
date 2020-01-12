//
//  ArcView.swift
//  CircleViewProject
//
//  Created by Teacher on 12/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ArcView: UIView {

    var strokeWidth : CGFloat = 2
    var progress : Float = 0.4 //0...1
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let w = self.bounds.width
        let h = self.bounds.height
        
        let midPoint = CGPoint(x: w / 2, y: h / 2)
        let radius = min(w, h) / 2 * 0.9
        
        //full circle
        let startAngle = 0.75 * CGFloat.pi
        let fullLength = 1.5 * CGFloat.pi
        
        context.addArc(center: midPoint,
                       radius: radius,
                       startAngle: startAngle,
                       endAngle: startAngle + fullLength,
                       clockwise: false)
        
        context.setLineWidth(self.strokeWidth)
        context.strokePath()
        
        context.addArc(center: midPoint,
                       radius: radius,
                       startAngle: startAngle,
                       endAngle: startAngle + CGFloat(progress) * fullLength,
                       clockwise: false)
        
        UIColor.systemRed.setStroke()
        context.setLineWidth(self.strokeWidth * 2)
        context.strokePath()
        
    }
    

}
