//
//  ViewController.swift
//  DrawSomething
//
//  Created by Teacher on 12/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func trashAction(_ sender: Any) {
        drawView.clear()
    }
    
}

