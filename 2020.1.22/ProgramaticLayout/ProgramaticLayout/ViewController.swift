//
//  ViewController.swift
//  ProgramaticLayout
//
//  Created by Teacher on 22/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildUI()
    }
    
    private func buildUI() {
        /*
         * Container View
         */
        let containerView = UIView(frame: .zero)
        containerView.backgroundColor = .systemGray
        //disable 'auto' constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(containerView)
        
        //setup layout for container view
        
        //bottom 0 to bottom safe area
        containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //leading & trailing
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //80% height
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        
        /*
         * Image View
         */
        
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "steve")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 80
        imageView.layer.masksToBounds = true
        
        containerView.addSubview(imageView)
        
        [
            imageView.widthAnchor.constraint(equalToConstant: 160),
            imageView.heightAnchor.constraint(equalToConstant: 160),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8)
            ].forEach{ $0.isActive = true }
        
        /*
        * Label
        */
        
        let label = UILabel(frame: .zero)
        label.text = "Steve Jobs R.I.P."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 48)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        
        [
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
            ].forEach{ $0.isActive = true }
    }


}

