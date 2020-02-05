//
//  RadioPlayer.swift
//  RadioPlayer
//
//  Created by Teacher on 05/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation
import AVFoundation



//final - subclassing is disabled

final class RadioPlayer {
    
    struct State {
        var urlString : String?
        var volume : Float //0...1
    }
    
    private var player : AVPlayer?
    var state : State {
        didSet {
            saveState()
        }
    }
    
    var isPlaying : Bool {
        return player != nil
    }
    
    var volume : Float {
        get{
            return state.volume
        }
        set{
            state.volume = newValue
            player?.volume = newValue
        }
    }
    
    //singleton
    static let shared = RadioPlayer()
    private init() {
        self.state = State(urlString: nil, volume: 1)
        readState()
    }
    
    private func saveState() {
        if let urlString = self.state.urlString {
            UserDefaults.standard.set(urlString, forKey: "station_url")
        }
        UserDefaults.standard.set(self.state.volume, forKey: "volume")
    }
    
    func readState() {
        let urlString = UserDefaults.standard.string(forKey: "station_url")
        let volume : Float
        if let value = UserDefaults.standard.object(forKey: "volume") as? Float {
            volume = value
        } else {
            volume = 1
        }
        
        self.state = State(urlString: urlString, volume: volume)
    }
    
    //public methods
    
    func play() {
        guard let urlString = self.state.urlString,
            let url = URL(string: urlString) else {
                return
        }
        self.player = AVPlayer(url: url)
        self.player?.volume = self.state.volume
        self.player?.play()
    }
    
    func pause() {
        self.player?.pause()
        self.player = nil
    }
}



















