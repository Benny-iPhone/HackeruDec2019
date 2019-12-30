//
//  ViewController.swift
//  ViewProperties
//
//  Created by Teacher on 29/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: "icons8-airplane_take_off")?.withRenderingMode(.alwaysTemplate)
        
        let allSegments = self.view.subviews.compactMap{ $0 as? UISegmentedControl}
        if let obj = allSegments.first{
            colorAction(obj)
            //obj.tintColor = .brown
        }
    }

    @IBAction func hiddenSwitchAction(_ sender: UISwitch) {
        self.view.viewWithTag(770)?.isHidden = !sender.isOn
        //myView.isHidden = !sender.isOn
        
    }
    
    
    @IBAction func alphaSliderAction(_ sender: UISlider) {
        
        //myView.backgroundColor = UIColor.black.withAlphaComponent(CGFloat(sender.value))
        myView.alpha = CGFloat(sender.value)
        
    }
    
    
    @IBAction func colorAction(_ sender: UISegmentedControl) {
        
        func change(){
            switch sender.selectedSegmentIndex {
            case 0:
                myView.backgroundColor = .systemBlue
                imageView.tintColor = .systemBlue
            case 1:
                myView.backgroundColor = .systemPurple
                imageView.tintColor = .systemPurple
            case 2:
                myView.backgroundColor = .systemGreen
                imageView.tintColor = .systemGreen
            default:
                return
            }
        }
        
        UIView.animate(withDuration: 1, animations: change)
        
    }
    
}

