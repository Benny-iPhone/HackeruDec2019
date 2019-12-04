//
//  ViewController.swift
//  MiniCalculator
//
//  Created by Teacher on 04/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func plusAction(_ sender: Any) {
        //solve using swift shortcuts
        let result = [firstTextField,secondTextField]
            .compactMap{ $0?.text}
            .compactMap{ Int($0)}
            .reduce(0) { $0 + $1}
        label.text = "\(result)"
        
        //solve using unwrapping optionals
        if let firstText = firstTextField.text,
            let firstNum = Int(firstText),
            let secondText = secondTextField.text,
            let secondNum = Int(secondText){
            
            label.text = "plus result is: \(firstNum + secondNum) 🤪"
            
        } else {
            label.text = ""
        }
        
    }
    
    
    

}

