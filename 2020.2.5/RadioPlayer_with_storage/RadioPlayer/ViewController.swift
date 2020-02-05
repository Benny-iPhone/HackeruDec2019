//
//  ViewController.swift
//  RadioPlayer
//
//  Created by Teacher on 02/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var pickerArray : [Station] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerArray = Station.getDemoStations()
        //self.state.urlString = "http://glzicylv01.bynetcdn.com/glglz_mp3"
        refreshButton()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        //select station if no station selected
        if RadioPlayer.shared.state.urlString == nil {
            self.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
        }
        
        volumeSlider.value = RadioPlayer.shared.volume
    }
    
    @IBAction func volumeAction(_ sender: UISlider) {
        RadioPlayer.shared.volume = sender.value
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
        if RadioPlayer.shared.isPlaying {
            RadioPlayer.shared.pause()
        } else {
            RadioPlayer.shared.play()
        }
        
        refreshButton()
    }
    
    private func refreshButton() {
        if RadioPlayer.shared.isPlaying {
            playPauseButton.setImage(UIImage(named: "icons8-pause"), for: .normal)
        } else {
            playPauseButton.setImage(UIImage(named: "icons8-play"), for: .normal)
        }
    }


}

extension ViewController : UIPickerViewDataSource , UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let player = RadioPlayer.shared
        
        player.state.urlString = pickerArray[row].urlString
        if player.isPlaying {
            player.play()
        }
    }
    
}
