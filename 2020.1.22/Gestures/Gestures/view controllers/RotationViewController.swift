//
//  RotationViewController.swift
//  Gestures
//
//  Created by Teacher on 22/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        
        guard let targetView = sender.view else { return }
        //set the view's transformation to the gesture's rotation angle.
        //נגדיר את שינוי הצורה לסיבוב בזווית המחווה
        //targetView.transform = CGAffineTransform(rotationAngle: sender.rotation)
        
        //current state
        var transform : CGAffineTransform = targetView.transform
        //append gesture's rotation
        transform = transform.rotated(by: sender.rotation)
        //set to view
        targetView.transform = transform
        
        //hey gesture, forget all your progress
        sender.rotation = 0
    }

}
