//
//  DrawView.swift
//  DrawSomething
//
//  Created by Teacher on 12/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    //each UIBezierPath is full movement of a finger
    private var beziers : [UIBezierPath]
    
    required init?(coder: NSCoder) {
        self.beziers = []
        super.init(coder: coder)
        
        //only one finger
        self.isMultipleTouchEnabled = false
    }
    
    func clear() {
        beziers = []
        
        //refresh draw
        self.setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let t = touches.first else { return }
        let point : CGPoint = t.location(in: self)
        
        //touches began in a new movement
        let bezier = UIBezierPath()
        bezier.move(to: point)
        
        self.beziers.append(bezier)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let t = touches.first else { return }
        let point : CGPoint = t.location(in: self)
        
        //the finger moved, add the point to the latest movement
        beziers.last?.addLine(to: point)
        //refresh draw
        self.setNeedsDisplay()
    }
    

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        beziers.forEach{ $0.stroke() }
        
//        for obj in beziers {
//            obj.stroke()
//        }
        
        
    }
    

}
