//
//  ViewController.swift
//  DrawSomething
//
//  Created by Teacher on 12/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

//ViewController inherits UIViewControlelr and implements ColorPickerViewControllerDelegate protocol
class ViewController: UIViewController , ColorPickerViewControllerDelegate {
    

    @IBOutlet weak var drawView: DrawView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func strokeWidthAction(_ sender: UISlider) {
        
        drawView.strokeWidth = CGFloat(sender.value)
        
    }
    
    @IBAction func colorAction(_ sender: UIBarButtonItem) {
        
        let color = UIColor(red: CGFloat.random(in: 0...1),
                            green: CGFloat.random(in: 0...1),
                            blue: CGFloat.random(in: 0...1),
                            alpha: 1)
        
        drawView.strokeColor = color
        sender.tintColor = color
    }
    
    @IBAction func trashAction(_ sender: Any) {
        drawView.clear()
    }
    
    //the destination view-controller created, not yet displayed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let colorVC = segue.destination as? ColorPickerViewController {
            colorVC.delegate = self
        }
    }
    
    func colorPickerViewController(_ controller: ColorPickerViewController, didSelectColor color: UIColor) {
        drawView.strokeColor = color
        //sender.tintColor = color
    }
    
}

