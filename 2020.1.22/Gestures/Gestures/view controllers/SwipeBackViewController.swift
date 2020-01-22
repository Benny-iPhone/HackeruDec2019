//
//  SwipeBackViewController.swift
//  Gestures
//
//  Created by Teacher on 19/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class SwipeBackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Swipe Back"
    }
    
    @IBAction func swipeBackAction(_ sender : Any) {
        //refer the navigation controller that (may) manage itself
        //ask it to pop back
        self.navigationController?.popViewController(animated: true)
    }

}
