//
//  CustomControl.swift
//  CustomControlProject
//
//  Created by Teacher on 29/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

fileprivate extension UIView {
    func applyTintForSubviews() {
        for subView in self.subviews {
            subView.tintColor = self.tintColor
            subView.applyTintForSubviews()
        }
    }
    
    func findImageViews() -> [UIImageView] {
        if let imageView = self as? UIImageView {
            return [imageView]
        }
        
        var result : [UIImageView] = []
        for subView in self.subviews {
            result += subView.findImageViews()
        }
        
        return result
    }
}

class CustomControl: UIControl {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        subviews.forEach {
            $0.isUserInteractionEnabled = false
        }
        
        layer.cornerRadius = 16
        layer.masksToBounds = true
        applyTintForSubviews()
        self.findImageViews().forEach {
            $0.image = $0.image?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        self.alpha = 0.6
        return super.beginTracking(touch, with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        self.alpha = 1
        super.endTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        self.alpha = 1
        super.cancelTracking(with: event)
    }

}
