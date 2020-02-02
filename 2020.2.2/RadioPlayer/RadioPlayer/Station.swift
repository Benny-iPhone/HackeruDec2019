//
//  Station.swift
//  RadioPlayer
//
//  Created by Teacher on 02/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

struct Station {
    let name : String
    let urlString : String
    
    static func getDemoStations() -> [Station] {
        return [
            Station(name: "גלגלצ", urlString: "http://glzicylv01.bynetcdn.com/glglz_mp3"),
            Station(name: "גלי צהל", urlString: "http://glzwizzlv.bynetcdn.com/glz_mp3"),
            Station(name: "אקו 99", urlString: "http://eco01.mediacast.co.il/ecolive/99fm/icecast.audio")
        ]
    }
}










