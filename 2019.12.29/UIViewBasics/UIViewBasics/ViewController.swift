//
//  ViewController.swift
//  UIViewBasics
//
//  Created by Teacher on 29/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemYellow
        
        createAView()
    }

    private func createAView() {
        
        let aView = UIView(frame: CGRect(x: 40, y: 40, width: 200, height: 250))
        aView.backgroundColor = .red
        
        let subView = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 150))
        subView.backgroundColor = .white
        aView.addSubview(subView)

        self.view.addSubview(aView)
        
        self.view.sendSubviewToBack(aView)

        
    }

    @IBAction func switchAction(_ sender: UISwitch) {
        
        sender.superview?.clipsToBounds = sender.isOn
        
    }
}

