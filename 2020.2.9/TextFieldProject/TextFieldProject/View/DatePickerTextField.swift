//
//  DatePickerTextField.swift
//  TextFieldProject
//
//  Created by Teacher on 09/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class DatePickerTextField: ToolbaredTextField {

    var date : Date {
        get {
            return self.datePicker.date
        }
        set (newDateValue){
            self.datePicker.date = newDateValue
            self.datePicker.sendActions(for: .valueChanged)
        }
    }
    
    private var datePicker : UIDatePicker {
        return self.inputView as! UIDatePicker
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createDatePicker()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createDatePicker()
    }
    
    //call this upon creation
    private func createDatePicker() {
        let datePicker = UIDatePicker()
        //Configs
        datePicker.locale = Locale(identifier: "he")
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
        
        self.inputView = datePicker
    }
    
    @objc func datePickerAction(_ sender : UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MMM/yyyy"
        self.text = formatter.string(from: sender.date)
        self.sendActions(for: .editingChanged)
    }

}
