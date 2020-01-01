//
//  ViewController.swift
//  Sevivon
//
//  Created by Teacher on 01/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.\
        
        //by default, user interaction is disabled for UILabel and UIImageView
        imageView.isUserInteractionEnabled = true
        
    }

    @IBAction func tapAction(_ sender: Any) {
        print("tap action")
        if let timer = self.timer {
            //stop
            timer.invalidate()
            self.timer = nil
        } else {
            //start
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { [weak self] _ in
                guard let self = self else { return }
                
                let newTransform = self.imageView.transform.rotated(by: 0.1)
                self.imageView.transform = newTransform
                
            })
        }
        
    }
    
}

