//
//  ViewController.swift
//  TraingleViewProject
//
//  Created by Teacher on 12/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tView: TraingleView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
         //Demo For Ziv
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            print("paiting")
            let startDate = Date()
            let tView = TraingleView(frame: CGRect(x: 0, y: 140, width: 300, height: 300))
            tView.backgroundColor = .white
            self.view.addSubview(tView)
            print("done")
            let endDate = Date()
            print("total \(endDate.timeIntervalSince1970 - startDate.timeIntervalSince1970)")
        }*/
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        
        tView.lineWidth = CGFloat(sender.value)
        
    }
    
    
    
}

