//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Teacher on 05/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthDateTextField: DatePickerTextField!
    @IBOutlet weak var stackViewTopLayout: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthDateTextField.date = Date(timeIntervalSinceNow: -86_400 * 60)
        
        //open keyboard
        nameTextField.becomeFirstResponder()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //start listen when view appear
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //stop listen when view disappear
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleKeyboardHide(_ notification : Notification) {
        stackViewTopLayout.constant = 16
        UIView.animate(withDuration: 1) {
            self.view.layoutSubviews()
        }
    }
    
    @objc func handleKeyboardShow(_ notification : Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        
        let textField = stackView.arrangedSubviews.filter{ $0.isFirstResponder }[0]
        let height = value.cgRectValue.height
        
        let y = max(textField.frame.origin.y + 100 - height,0)
        stackViewTopLayout.constant = 16 - y
        
        UIView.animate(withDuration: 1) {
            self.view.layoutSubviews()
        }
        
    }
    
    @IBAction func didEndOnExitAction(_ sender: UITextField) {
        
        if let nextTextField = self.view.viewWithTag(sender.tag + 1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            sender.resignFirstResponder()
        }
        
    }
    

    @IBAction func tapAction(_ sender: Any) {
        //close keyboard for specific text field
        //nameTextField.resignFirstResponder()
        //close keyboard for all text-fields
        self.view.endEditing(true)

    }
    
}

