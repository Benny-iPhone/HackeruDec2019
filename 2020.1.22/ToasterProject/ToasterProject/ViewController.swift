//
//  ViewController.swift
//  ToasterProject
//
//  Created by Teacher on 22/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showToastAction(_ sender: Any) {
        Toaster().toast(text: "hello world", on: self.view)
    }
    
}

