//
//  Movie.swift
//  TheMovieDBSwiftUI
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

struct Movie : Codable, Identifiable{
    let id : Int
    let title : String
    let overview : String
    let poster_path : String
    
    var posterURL : URL {
        return URL(string: "https://image.tmdb.org/t/p/w185" + poster_path)!
    }
    
    static var demo : Movie {
        Movie(id: 1, title: "Test Title", overview: "Line 1\nLine 2\nLine 3", poster_path: "/db32LaOibwEliAmSL2jjDF6oDdj.jpg")
    }
}
