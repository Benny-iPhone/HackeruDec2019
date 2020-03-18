//
//  ViewController.swift
//  MoshikoHelper
//
//  Created by Teacher on 18/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // *** Solution 2
    weak var alertDateTextField : UITextField?
    var selectedDate : Date?
    
    // ***

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func alertDatePickerAction(_ sender : UIDatePicker) {
        print(sender.date)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let text = formatter.string(from: sender.date)

        //Solution 2: **
        alertDateTextField?.text = text
        self.selectedDate = sender.date
        // ***
        
        /*
        //Solution 1: ***
        guard let alertController = self.presentedViewController as? UIAlertController else {
            return
        }
        guard let dateTextField = alertController.textFields?.last else {
            return
        }
        
        dateTextField.text = text
        
        // ***
 */
        
    }

    @IBAction func showAlertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Data", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Type a name"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Birthdate"
            
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
            datePicker.backgroundColor = .white
            datePicker.addTarget(self, action: #selector(self.alertDatePickerAction(_:)), for: .valueChanged)
            //self.alertDatePickerAction(datePicker)
            
            textField.inputView = datePicker
            
            //Solution 2:
            self.selectedDate = nil
            self.alertDateTextField = textField
            // ***
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            guard let name = alert.textFields?.first?.text else {
                return
            }
            
            // Solution 1 ****
            if let dateText = alert.textFields?.last?.text {
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                
                if let date = formatter.date(from: dateText) {
                    print("date: \(date)")
                }
            }
            // ****
            
            //Solution 2 ***
            if let date = self.selectedDate {
                print("date: \(date)")
            }
            //***
            
            print("name: \(name)")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

