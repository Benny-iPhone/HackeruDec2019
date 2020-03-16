//
//  ViewController.swift
//  ThreadSafeData
//
//  Created by Teacher on 15/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myStack = Stack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func testStackAction(_ sender: Any) {
        
        for i in 1...1000 {
            myStack.add(object: i)
        }
        
        print(myStack.getCount())
        
    }
    
}

