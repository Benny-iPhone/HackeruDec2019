//
//  ViewController.swift
//  TickTimer
//
//  Created by Teacher on 25/12/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playAction(_ sender: UIButton) {
        sender.isEnabled = false
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self](timer) in
            guard let self = self else{
                //screen released
                timer.invalidate()
                return
            }
            self.playSound()
            print("timer action")
        }
    }
 
    func playSound(){
        if player == nil {
            let url = Bundle.main.url(forResource: "sound", withExtension: "wav")!
            player = try? AVAudioPlayer(contentsOf: url)
        }
        
        player?.play()
    }
    
}

