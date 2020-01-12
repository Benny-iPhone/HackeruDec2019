//
//  CircleView.swift
//  CircleViewProject
//
//  Created by Teacher on 12/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var strokeWidth : CGFloat = 10

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        var ellipseRect = self.bounds
        ellipseRect.origin.x = strokeWidth / 2
        ellipseRect.origin.y = strokeWidth / 2
        ellipseRect.size.width -= strokeWidth
        ellipseRect.size.height -= strokeWidth
        
        context.addEllipse(in: ellipseRect)
        context.setLineWidth(self.strokeWidth)
        context.strokePath()
        
    }
    

}
