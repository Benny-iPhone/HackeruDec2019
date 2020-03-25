//
//  ViewController.swift
//  ZikoButton
//
//  Created by Teacher on 25/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timerRemainingOperations : Int = 0
    weak var operationTimer : Timer?
    @IBOutlet weak var operationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func doSomething() {
        print("doing something")
    }
    
    @objc func timerAction(_ timer : Timer) {
        self.timerRemainingOperations -= 1
        doSomething()
        
        if self.timerRemainingOperations == 0 {
            timer.invalidate() //stop timer
            self.operationTimer = nil
            self.operationButton.isEnabled = true
            return
        }
        
    }

    @IBAction func buttonPressed(_ sender: Any) {
        if self.operationTimer != nil {
            return
        }
        self.operationButton.isEnabled = false
        doSomething()
        
        self.timerRemainingOperations = 5
        self.operationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction(_:)), userInfo: nil, repeats: true)
    }
    
}

