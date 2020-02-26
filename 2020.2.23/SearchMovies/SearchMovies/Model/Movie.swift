//
//  Movie.swift
//  SearchMovies
//
//  Created by Teacher on 19/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

struct Movie {
    //mandatory properties
    let id : Int
    let title : String
    
    //non-mandatory properties
    let overview : String?
    let original_title : String?
    private let poster_path : String?
    let release_date : String?
    
    var budget : Int64?
    var revenue : Int64?
    var homepage : String?
    
    var posterURL : URL? {
        guard let poster_path = self.poster_path else {
            return nil
        }
        
        return URL(string: "https://image.tmdb.org/t/p/w185" + poster_path)
    }
    
    var largePosterURL : URL? {
        guard let poster_path = self.poster_path else {
            return nil
        }
        
        return URL(string: "https://image.tmdb.org/t/p/w500" + poster_path)
    }
    
    init?(_ dict : [String:Any]) {
        guard let id = dict["id"] as? Int,
            let title = dict["title"] as? String else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.overview = dict["overview"] as? String
        self.original_title = dict["original_title"] as? String
        self.poster_path = dict["poster_path"] as? String
        self.release_date = dict["release_date"] as? String
    }
    
    mutating func appendData(from dict : [String:Any]) {
        self.budget = dict["budget"] as? Int64
        self.revenue = dict["revenue"] as? Int64
        self.homepage = dict["homepage"] as? String
    }
}


















