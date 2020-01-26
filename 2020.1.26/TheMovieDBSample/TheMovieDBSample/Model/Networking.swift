//
//  Networking.swift
//  TheMovieDBSample
//
//  Created by Teacher on 26/01/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

struct Networking {
    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey = "e898f9a386bfdb67610421b879360e02"
    
    func discoverMovies(with callback : @escaping ([Movie])->Void) {
        var comps = URLComponents(string: baseURL + "/discover/movie")
        comps?.queryItems = [
            URLQueryItem(name: "api_key", value: self.apiKey),
            URLQueryItem(name: "sort_by", value: "popularity.desc")
        ]
        
        guard let url = comps?.url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    callback([])
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(MovieResult.self, from: data)
                DispatchQueue.main.async {
                    callback(result.results)
                }
            } catch {
                DispatchQueue.main.async {
                    callback([])
                }
            }
            
        }.resume()
        
    }
    
}

