//
//  ViewController.swift
//  DateConverter
//
//  Created by HACKERU on 11/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Mode : Int{
        case gregToHeb //0
        case hebToGreg //1
    }
    
    var mode : Mode = .gregToHeb

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        refresh()
    }
    
    private func updateDatePicker() {
        switch mode {
        case .gregToHeb:
            datePicker.calendar = Calendar(identifier: .gregorian)
            datePicker.locale = Locale(identifier: "en")
        case .hebToGreg:
            datePicker.calendar = Calendar(identifier: .hebrew)
            datePicker.locale = Locale(identifier: "he")
        }
    }
    
    private func refresh() {
        let date = datePicker.date
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long //DateFormatter.Style.medium
        formatter.timeStyle = .none //DateFormatter.Style.none
        
        switch self.mode {
        case .gregToHeb:
            formatter.calendar = Calendar(identifier: .hebrew) //Calendar.Identifier.hebrew
            formatter.locale = Locale(identifier: "he")
        case .hebToGreg:
            formatter.calendar = Calendar(identifier: .gregorian) //Calendar.Identifier.gregorian
            formatter.locale = Locale(identifier: "en")
        }
        
        label.text = formatter.string(from: date)
        //label.text = "\(date)"
    }
    
    @IBAction func datePickerAction(_ sender: Any) {
        refresh()
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        
        let index = segmentedControl.selectedSegmentIndex
        if let newMode = Mode(rawValue: index) {
            self.mode = newMode
            updateDatePicker()
            refresh()
        } else {
            print("WARNING - UNSUPPORTED INDEX \(index)")
        }
        
        
    }
    


}

