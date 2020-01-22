//
//  Toaster.swift
//  ToasterProject
//
//  Created by Teacher on 22/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class Toaster {
    
    enum Position {
        case top
        case center
        case bottom
        
        fileprivate var multiplier : CGFloat {
            switch self {
            case .top:
                return 0.5
            case .center:
                return 1
            case .bottom:
                return 1.5
            }
        }
    }
    
    var position : Position
    var fadeInDuration : TimeInterval
    var fadeOutDuration : TimeInterval
    var delayDuration : TimeInterval
    
    var font : UIFont
    var textColor : UIColor
    var backgroundColor : UIColor
    
    var cornerRadius : CGFloat
    var margin : CGFloat
    
    init(){
        self.position = .bottom
        self.fadeInDuration = 1
        self.fadeOutDuration = 1
        self.delayDuration = 1
        self.font = UIFont.boldSystemFont(ofSize: 24)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.textColor = .white
        self.cornerRadius = 8
        self.margin = 12
    }
    
    
    func toast(text : String, on view : UIView) {
        guard Thread.current.isMainThread else {
            DispatchQueue.main.async {
                self.toast(text: text, on: view)
            }
            return
        }
        
        //setup container
        let containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = self.backgroundColor
        containerView.layer.cornerRadius = self.cornerRadius
        containerView.layer.masksToBounds = true
        
        //setup label
        let label = UILabel(frame: .zero)
        label.text = text
        
        label.font = self.font
        label.textColor = self.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(label)
        
        //layout
        [
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: margin),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin),
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: margin),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -margin)
            ].forEach { $0.isActive = true }
        
        //display
        
        view.addSubview(containerView)
        
        [
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -8),
            containerView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 8)
            
            ].forEach{ $0.isActive = true }
        
        
        
        containerView.alpha = 0
        
        //animation
        UIView.animate(withDuration: self.fadeInDuration, animations: {
            containerView.alpha = 1
        }) { (_) in
            //fade in finished
            UIView.animate(withDuration: self.fadeOutDuration, delay: self.delayDuration, animations: {
                containerView.alpha = 0
            }) { (_) in
                //fade out finished
                containerView.removeFromSuperview()
            }
        }
    }
    
}
