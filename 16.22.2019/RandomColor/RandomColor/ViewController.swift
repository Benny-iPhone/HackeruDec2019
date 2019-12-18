//
//  ViewController.swift
//  RandomColor
//
//  Created by HACKERU on 15/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var random : UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1)
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIColor.red
    }

    @IBAction func actionButton(_ sender: Any) {
        
        UIView.animate(withDuration: 1.5) {
            self.view.backgroundColor = .random
//            self.label.backgroundColor = UIColor.random
//            self.view.layoutIfNeeded()
        }
        
//        label.backgroundColor = .random
        
//        label.backgroundColor = UIColor.randomColor()
//
//        let greenValue = Int.random(in: 0...255)
//        let blueValue = Int.random(in: 0...255)
//
//        let color = UIColor(red: .random(in: 0...1), green: CGFloat(greenValue) / 255, blue: CGFloat(blueValue) / 255, alpha: 1)
//
//        label.backgroundColor = color
    }
    
    

}

