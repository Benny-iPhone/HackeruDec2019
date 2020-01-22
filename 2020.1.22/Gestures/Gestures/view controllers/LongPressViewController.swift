//
//  LongPressViewController.swift
//  Gestures
//
//  Created by Teacher on 19/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class LongPressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        
        switch sender.state {
        case .began:
            sender.view?.alpha = 0.6
            let randomColor = UIColor(red: .random(in: 0...1),
                                      green: .random(in: 0...1),
                                      blue: .random(in: 0...1),
                                      alpha: 1)
            
            sender.view?.backgroundColor = randomColor
            
        case .ended, .failed, .cancelled:
            sender.view?.alpha = 1
            sender.view?.backgroundColor = .systemGreen
            return
        case .possible, .changed:
            return
        @unknown default:
            return
        }
        
    }
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
