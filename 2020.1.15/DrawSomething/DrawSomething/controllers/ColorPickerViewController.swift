//
//  ColorPickerViewController.swift
//  DrawSomething
//
//  Created by Teacher on 15/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

protocol ColorPickerViewControllerDelegate : class {
    func colorPickerViewController(_ controller : ColorPickerViewController, didSelectColor color : UIColor)
}

class ColorPickerViewController: UIViewController {
    //referencing a object of class that implements the protocol 'ColorPickerViewControllerDelegate', see line 50
    weak var delegate : ColorPickerViewControllerDelegate?
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        //self.modalPresentationStyle = .overFullScreen
        
        bgView.layer.cornerRadius = 16
        bgView.layer.masksToBounds = true
    }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: self.view)
        if bgView.frame.contains(tapPoint) {
            return
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func sliderAction() {
        let color = UIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: 1)
        
        bgView.backgroundColor = color
        
        //notify delegate
        self.delegate?.colorPickerViewController(self, didSelectColor: color)
    }

}
