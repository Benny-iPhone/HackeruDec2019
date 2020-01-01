//
//  ViewController.swift
//  WeakifySelf
//
//  Created by Teacher on 01/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemBlue
        
        setupTimer()
    }
    
    private func setupTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self](t) in
//            guard let strongSelf = self else {
//                return
//            }
            
            guard let self = self else {
                t.invalidate()
                return
            }
            self.printSomething()
        }
    }
    
    private func printSomething() {
        print("printing something")
    }


}

