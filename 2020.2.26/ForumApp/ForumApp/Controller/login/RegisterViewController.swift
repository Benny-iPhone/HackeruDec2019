//
//  RegisterViewController.swift
//  ForumApp
//
//  Created by Teacher on 26/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        //validate content
        guard let email = emailTextField.text, email.count > 0,
            let nickname = nicknameTextField.text, nickname.count > 0,
            let password = passwordTextField.text, password.count > 0,
            let password2 = retypePasswordTextField.text, password == password2 else {
                print("content not valid")
                return
        }
        
        //disable button
        sender.isEnabled = false
        
        //create firebase user
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                //create user failed
                print("failed with error \(error)")
                sender.isEnabled = true
                return
            }
            
            //set nickname
            let request = result!.user.createProfileChangeRequest()
            request.displayName = nickname
            request.commitChanges { (commitError) in
                //update main UI, create user was successful
                FlowController.shared.determineRoot()
            }
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
