//
//  ViewController.swift
//  MiniCalculator
//
//  Created by Teacher on 04/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        print("asdasd")
    }
    
    func readNumbers() -> (first: Int, second: Int)?{
        guard let firstText = firstTextField.text, !firstText.isEmpty else{
            label.text = "first text is empty"
            return nil
        }
        
        guard let firstNum = Int(firstText) else{
            label.text = "first text is not a number"
            return nil
        }
        
        guard let secondText = secondTextField.text, secondText.count > 0 else{
            label.text = "second text is empty"
            return nil
        }
        
        guard let secondNum = Int(secondText) else{
            label.text = "second number is invalid"
            return nil
        }
        
        return (firstNum,secondNum)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //firstTextField.keyboardType = UIKeyboardType.numberPad
        firstTextField.keyboardType = .numberPad
        secondTextField.keyboardType = .numberPad
        
    }
    
    
    @IBAction func minusAction(_ sender: Any) {
        if let firstText = firstTextField.text, //text is not nil
            let firstNum = Int(firstText), //parse text to Int
            let secondText = secondTextField.text, //text is not nil
            let secondNum = Int(secondText){ //parse text to Int
            
            label.text = "minus result is: \(firstNum - secondNum) 🤪"
            
        } else {
            label.text = ""
        }
    }
    
    @IBAction func divAction(_ sender: Any) {
        guard let numbers = readNumbers() else{
            return
        }
        
        guard numbers.1 != 0 else{
            label.text = "can not divide by 0"
            return
        }
        
        
        let result = Double(numbers.first) / Double(numbers.second)
        label.text = "div result: \(result)"
        
        /*
        if firstTextField.text == nil || firstTextField.text!.count == 0{
            label.text = "first text is empty"
            return
        }
        
        
        
        if let firstText = firstTextField.text{
            if let firstNum = Int(firstText){
                if let secondText = secondTextField.text{
                    if let secondNum = Int(secondText){
                        if secondNum != 0{
                            
                        } else {
                            
                        }
                    } else {
                        label.text = "second test is not a number"
                    }
                } else {
                    label.text = "second text is empty"
                }
            } else {
                label.text = "first test is not a number"
            }
        } else {
            label.text = "first text is empty"
        }
        */
        
    }
    
    @IBAction func multiAction(_ sender: Any) {
        guard let numbers = readNumbers() else{ return }
        let result = numbers.0 * numbers.1
        label.text = "multi result is: \(result) 🤪"
        
        /*
        if let firstText = firstTextField.text,
            let firstNum = Int(firstText),
            let secondText = secondTextField.text,
            let secondNum = Int(secondText){
            
            label.text = "multi result is: \(firstNum * secondNum) 🤪"
            
        } else {
            label.text = ""
        }*/
    }
    
    @IBAction func plusAction(_ sender: Any) {
        //solve using swift shortcuts
        let result = [firstTextField,secondTextField]
            .compactMap{ $0?.text}
            .compactMap{ Int($0)}
            .reduce(0) { $0 + $1}
        label.text = "\(result)"
        
        //solve using unwrapping optionals
        if let firstText = firstTextField.text,
            let firstNum = Int(firstText),
            let secondText = secondTextField.text,
            let secondNum = Int(secondText){
            
            label.text = "plus result is: \(firstNum + secondNum) 🤪"
            
        } else {
            label.text = ""
        }
        
    }
    
    
    

}

