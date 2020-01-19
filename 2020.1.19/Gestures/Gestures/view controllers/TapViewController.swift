//
//  TapViewController.swift
//  Gestures
//
//  Created by Teacher on 19/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        //point where tapped
        let point = sender.location(in: self.view)
        
        //move UI to point with animation
        UIView.animate(withDuration: 0.7) {
            self.orangeView.center = point
        }
        
        //move UI to point
        //orangeView.center = point
    }
    
}
