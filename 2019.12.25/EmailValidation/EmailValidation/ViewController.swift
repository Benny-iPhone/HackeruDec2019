//
//  ViewController.swift
//  EmailValidation
//
//  Created by Teacher on 25/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.textContentType = .emailAddress
        
        statusLabel.text = ""
    }

    @IBAction func validateEmailAction(_ sender: Any) {
        
        guard let text = emailTextField.text, text.count > 0 else{
            statusLabel.text = ""
            return
        }
        
        if text.isEmail {
            statusLabel.text = "Valid"
            statusLabel.textColor = .blue
        } else {
            statusLabel.text = "Invalid"
            statusLabel.textColor = .red
        }
        
    }
    
    
    
}










