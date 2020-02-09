//
//  ToolbaredTextField.swift
//  TextFieldProject
//
//  Created by Teacher on 09/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ToolbaredTextField: UITextField {

    //@IBInspectable var shouldCreateToolbar : Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupToolbar()
    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupToolbar()
    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        setupToolbar()
//    }
    
    //call this method upon creation
    private func setupToolbar() {
//        guard shouldCreateToolbar else {
//            self.inputAccessoryView = nil
//            return
//        }
//        guard self.keyboardType == .phonePad || self.keyboardType == .numberPad else {
//            return
//        }
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        
        let buttonTitle = self.returnKeyType == .next ? "Next" : "Done"
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let actionButton = UIBarButtonItem(title: buttonTitle, style: .done, target: self, action: #selector(buttonPressed(_:)))
        toolbar.items = [spaceButton,actionButton]
        
        self.inputAccessoryView = toolbar
    }
    
    @objc func buttonPressed(_ sender : Any) {
        self.sendActions(for: .editingDidEndOnExit)
    }
}
