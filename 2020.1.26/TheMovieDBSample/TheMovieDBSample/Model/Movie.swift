//
//  Movie.swift
//  TheMovieDBSample
//
//  Created by Teacher on 26/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

struct MovieResult : Codable {
    let results : [Movie]
}

struct Movie : Codable {
    let title : String
    let id : Int
    let overview : String
    let poster_path : String
    
    var postPathURL : URL? {
        return URL(string: "https://image.tmdb.org/t/p/w185" + poster_path)
    }
}
