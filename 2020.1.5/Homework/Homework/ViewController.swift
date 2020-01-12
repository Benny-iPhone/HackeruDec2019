//
//  ViewController.swift
//  Homework
//
//  Created by Teacher on 05/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Direction : Int {
        case left = 100, up, down, right
        
        var stepValue : CGFloat {
            switch self {
            case .left: return -20
            case .right: return 20
            case .up: return -40
            case .down: return 40
            }
        }
        
        var isVertical : Bool { //is y axis
            return self == .up || self == .down
        }
    }
    
    @IBOutlet weak var imageViewHLayout: NSLayoutConstraint!
    @IBOutlet weak var imageViewVLayout: NSLayoutConstraint!
    
    @IBOutlet weak var ballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func directionAction(_ sender: UIButton) {
        
        guard let direction = Direction(rawValue: sender.tag) else {
            debugPrint("unsupported tag \(sender.tag)")
            return
        }
        
        //check for nil
        //let num = Int("ab") ?? Int("0")
        
        
        //check for boolean expression
        //Int("ab") != nil ? "1" : "0"
        //let layout = direction.isVertical ? imageViewVLayout : imageViewHLayout
        let layout : NSLayoutConstraint?
        if direction.isVertical {
            layout = imageViewVLayout
        } else {
            layout = imageViewHLayout
        }
        
        layout?.constant += direction.stepValue
        
        sender.isEnabled = false
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.layoutSubviews()
        }) { [weak sender](success) in
            sender?.isEnabled = true
        }
        
//        UIView.animate(withDuration: 0.5) { [weak self] in
//            self?.view.layoutSubviews()
//        }
    }
    

    @IBAction func rightAction(_ sender: UIButton) {
        
//
//        UIView.animate(withDuration: 1) { [weak self] in
//            self?.ballImageView.frame.origin.x += 40
//        }
        
        sender.isEnabled = false
        
        UIView.animate(withDuration: 1, animations: { [weak self] in
            //animation code
            self?.ballImageView.frame.origin.x += 40
        }) { [weak sender](success) in
            //animation finished code, refernce to sender is nil
            sender?.isEnabled = true
        }
        
        //a demo code to remove the button from the UI after 0.1 seconds, operation run on main thread
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            sender.removeFromSuperview()
//        }
        
    }
    
}

