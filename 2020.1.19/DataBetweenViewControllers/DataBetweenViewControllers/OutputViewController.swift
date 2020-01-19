//
//  OutputViewController.swift
//  DataBetweenViewControllers
//
//  Created by Teacher on 19/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController, InputViewControllerDelegate {

    @IBOutlet weak var label: UILabel!

    func inputViewController(_ controller: InputViewController, didChangeText text: String) {
        label.text = text
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let inputVC = segue.destination as? InputViewController {
            //inputVC.textField?.text = self.label.text
            inputVC.defaultText = self.label.text
            inputVC.delegate = self
        }
        
    }
    

}
