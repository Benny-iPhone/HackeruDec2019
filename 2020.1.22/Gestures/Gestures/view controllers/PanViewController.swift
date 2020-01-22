//
//  PanViewController.swift
//  Gestures
//
//  Created by Teacher on 19/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        guard let targetView = sender.view else {
            return
        }
        
        let point = sender.location(in: self.view)
        targetView.center = point
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
