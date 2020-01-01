//
//  ViewController.swift
//  HomeworkAngle
//
//  Created by Teacher on 01/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func closeKeyboardAction(_ sender: Any) {
        
        if textField.isFirstResponder{
            //close keyboard
            textField.resignFirstResponder()
        } else {
            //open keyboard
            textField.becomeFirstResponder()
        }
        
    }
    
    @IBAction func angleTextFieldEditingChanged(_ sender: UITextField) {
        let angle = Double(sender.text ?? "") ?? 0
        
        func deg2rad(_ number: Double) -> Double {
            return number * .pi / 180
        }
        
        let radiansValue = deg2rad(angle)
        
        slider.transform = CGAffineTransform.init(rotationAngle: CGFloat(radiansValue))
    }
    
    

}

