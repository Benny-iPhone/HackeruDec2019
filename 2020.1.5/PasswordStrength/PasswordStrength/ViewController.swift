//
//  ViewController.swift
//  PasswordStrength
//
//  Created by Teacher on 05/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: StrengthLabel!
    var model = Model(password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func editingChangedAction(_ sender: UITextField) {
        model.password = sender.text ?? ""
        
        let strength = model.getStrength()
        
        label.show(strength: strength)
        
        /*
        switch model.getStrength() {
        case .meduim:
            //set text and color
        default:
            <#code#>
        }*/
    }
    

}

