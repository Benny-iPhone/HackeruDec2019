//
//  ViewController.swift
//  ButtonProject
//
//  Created by Teacher on 29/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var systemStyleButton: UIButton!
    @IBOutlet weak var customStyleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configCustomButton()
        configSystemButton()
    }
    
    private func configSystemButton() {
        //systemStyleButton.tintColor = .systemIndigo
        systemStyleButton.tintColor = .white
        systemStyleButton.backgroundColor = .systemIndigo
        
        systemStyleButton.layer.cornerRadius = 16
        systemStyleButton.layer.masksToBounds = true
        
        systemStyleButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 32, bottom: 12, right: 32)
        
        systemStyleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        systemStyleButton.setTitle("Line 1\nLine 2", for: .normal)
        systemStyleButton.titleLabel?.numberOfLines = 2
        
        systemStyleButton.setImage(UIImage(named: "icons8-minion"), for: .normal)
        //systemStyleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        //systemStyleButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
    
    private func configCustomButton() {
        customStyleButton.addTarget(self, action: #selector(customButtonPressed), for: .touchUpInside)
        customStyleButton.setTitleColor(.systemBlue, for: .normal)
        customStyleButton.setTitleColor(UIColor.systemBlue.withAlphaComponent(0.4), for: .highlighted)
        
        customStyleButton.setTitleColor(UIColor.red.withAlphaComponent(0.7), for: .disabled)
        customStyleButton.setTitle("Disabled", for: .disabled)
        //customStyleButton.setTitleColor(.systemGreen, for: .highlighted)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        customStyleButton.isEnabled = sender.isOn
    }
    
    @objc func customButtonPressed() {
        print(#function)
//        print(#line)
//        print(#file)
    }


}

