//
//  InputViewController.swift
//  DataBetweenViewControllers
//
//  Created by Teacher on 19/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

protocol InputViewControllerDelegate : class {
    func inputViewController(_ controller : InputViewController, didChangeText text : String)
}

class InputViewController: UIViewController {
    
    var defaultText : String?
    weak var delegate : InputViewControllerDelegate?

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = defaultText
    }
    
    @IBAction func editingChangedAction(_ sender: UITextField) {
        let text = sender.text ?? ""
        delegate?.inputViewController(self, didChangeText: text)
    }
    

}
