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
    
    struct State {
        var urlString : String?
        var isPlaying : Bool
        var volume : Float //0...1
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var playPauseButton: UIButton!
    var player : AVPlayer?
    var state : State
    var pickerArray : [Station] = []
    
    required init?(coder: NSCoder) {
        self.state = State(urlString: nil, isPlaying: false, volume: 1)
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerArray = Station.getDemoStations()
        self.state.urlString = pickerArray.first?.urlString
        //self.state.urlString = "http://glzicylv01.bynetcdn.com/glglz_mp3"
        refreshButton()
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    @IBAction func volumeAction(_ sender: UISlider) {
        self.state.volume = sender.value
        self.player?.volume = state.volume
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
        if state.isPlaying {
            self.pause()
        } else {
            self.play()
        }
        
        refreshButton()
    }
    
    private func refreshButton() {
        if state.isPlaying {
            playPauseButton.setImage(UIImage(named: "icons8-pause"), for: .normal)
        } else {
            playPauseButton.setImage(UIImage(named: "icons8-play"), for: .normal)
        }
    }
    
    private func play() {
        guard let urlString = self.state.urlString,
            let url = URL(string: urlString) else {
                return
        }
        self.player = AVPlayer(url: url)
        self.player?.volume = self.state.volume
        self.player?.play()
        
        self.state.isPlaying = true
    }
    
    private func pause() {
        self.player?.pause()
        self.player = nil
        
        self.state.isPlaying = false
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
        
        self.state.urlString = pickerArray[row].urlString
        if state.isPlaying {
            play()
        }
    }
    
}
