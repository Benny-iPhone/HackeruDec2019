//
//  ViewController.swift
//  ImageViewProject
//
//  Created by Teacher on 26/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupImageView()
        setupLinkedInImageView()
    }
    
    private func setupLinkedInImageView() {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "icons8-linkedin")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .purple
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        [
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ].forEach { $0.isActive = true }
    }
    
    private func setupImageView() {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "gmail_icon")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        [
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ].forEach { $0.isActive = true }
    }


}

