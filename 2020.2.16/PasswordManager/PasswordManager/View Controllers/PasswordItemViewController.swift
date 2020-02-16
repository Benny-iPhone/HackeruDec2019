//
//  PasswordItemViewController.swift
//  PasswordManager
//
//  Created by Teacher on 16/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class PasswordItemViewController: UIViewController {

    @IBOutlet weak var titleTextField : UITextField!
    @IBOutlet weak var identityTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender : Any) {
        guard let title = titleTextField.text,
            let identity = identityTextField.text,
            let password = passwordTextField.text else {
                return
        }
        
        if identity.isEmpty && password.isEmpty {
            return
        }
        
        let item = PasswordItem()
        item.title = title
        item.identity = identity
        item.password = password
        
        DBManager.manager.add(object: item)
        
        //UI - Go Back
        self.navigationController?.popViewController(animated: true)
    }
    
}
