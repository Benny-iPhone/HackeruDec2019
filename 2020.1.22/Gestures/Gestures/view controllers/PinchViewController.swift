//
//  PinchViewController.swift
//  Gestures
//
//  Created by Teacher on 22/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
        guard let targetView = sender.view else { return }
        
        let transform : CGAffineTransform = targetView.transform
        targetView.transform = transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0

        //for those who want to restore to initial transform when gesture ended.
        switch sender.state {
        case .ended, .failed, .cancelled:
            UIView.animate(withDuration: 0.7) {
                targetView.transform = .identity
            }
        default:
            break
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
