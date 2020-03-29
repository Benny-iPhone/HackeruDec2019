//
//  ViewController.swift
//  SaveToDiskProject
//
//  Created by Teacher on 29/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let stringKey = "string"
    private let soundKey = "sound"
    private let sliderKey = "slider"

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var soundSwitchLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        print(path)
        
        updateUI()
    }
    
    private func updateUI() {
        
        //read text
        if let text = UserDefaults.standard.string(forKey: stringKey) { //read from disk
            textField.text = text
        }
        
        //read slider value
        let sliderValue : Float
        if let storedValue = UserDefaults.standard.object(forKey: sliderKey) as? Float {
            sliderValue = storedValue
        } else {
            sliderValue = 0.5
        }
        slider.value = sliderValue
        
        sliderAction(slider)
        
        //read sound (Boolean)
        let sound : Bool
        if let storedValue = UserDefaults.standard.object(forKey: soundKey) as? Bool {
            sound = storedValue
        } else {
            sound = true
        }
        
        soundSwitch.isOn = sound
        
        soundSwitchAction(soundSwitch)
    }

    //keyboard return key pressed
    @IBAction func textFieldDidEndOnExitAction(_ sender: UITextField) {
        //TBD - Save To Disk
        let defaults = UserDefaults.standard
        defaults.set(sender.text, forKey: stringKey)
        defaults.synchronize()
        
        //close keyboard
        sender.resignFirstResponder()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        //TBD - Save To Disk
        UserDefaults.standard.set(sender.value, forKey: sliderKey)
        UserDefaults.standard.synchronize()
        
        //update ui
        sliderLabel.text = String(format: "%.2f", sender.value)
    }
    
    
    @IBAction func soundSwitchAction(_ sender: UISwitch) {
        //TBD - Save To Disk
        UserDefaults.standard.set(sender.isOn, forKey: soundKey)
        UserDefaults.standard.synchronize()
        
        //update ui
        if sender.isOn {
            soundSwitchLabel.text = "Sound ON"
        } else {
            soundSwitchLabel.text = "Sound OFF"
        }
    }
}

