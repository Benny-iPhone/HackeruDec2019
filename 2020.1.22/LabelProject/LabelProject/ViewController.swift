//
//  ViewController.swift
//  LabelProject
//
//  Created by Teacher on 22/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let boldLabel = BoldLabel(frame: .zero)
        boldLabel.text = "I am BoldLabel"
        boldLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(boldLabel)
        
        [
            boldLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            boldLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ].forEach { $0.isActive = true }
        
    }


}

