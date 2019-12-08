//
//  ViewController.swift
//  IBActionAndIBOutletTroubleshooting
//
//  Created by Teacher on 08/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iPhoneLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        iPhoneLabel?.text = "iPhone"
        iPhoneLabel?.textColor = .red
        
    }
    
    @IBAction func buttonPressedClickMeNow(_ sender: UIButton) {
        print(#function)
        
        if sender.tintColor == UIColor.orange{
            sender.tintColor = .red
        } else {
            sender.tintColor = .orange
        }
        
        
    }
    
    


}

