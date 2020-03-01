//
//  LoginViewController.swift
//  ForumApp
//
//  Created by Teacher on 26/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        //validate content
        guard let email = emailTextField.text, email.count > 0,
            let password = passwordTextField.text, password.count > 0 else {
                print("invalid content")
                return
        }
        
        //disable button
        sender.isEnabled = false
        
        //login to firebase
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("login failed with error \(error)")
                sender.isEnabled = true
                return
            }
            
            FlowController.shared.determineRoot()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
