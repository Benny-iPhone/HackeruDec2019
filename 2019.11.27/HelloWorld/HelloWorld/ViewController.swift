//
//  ViewController.swift
//  HelloWorld
//
//  Created by Benny Davidovitz on 27/11/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        //let text = textField.text == nil ? textField.text! : ""
        // ?? => if left expression is nil, use the right one
        let text = textField.text ?? ""
        
        label.text = "Hello " + text + " 🥰"
        
    }

}

