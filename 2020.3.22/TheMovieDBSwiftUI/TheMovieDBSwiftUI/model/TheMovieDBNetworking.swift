//
//  TheMovieDBNetworking.swift
//  TheMovieDBSwiftUI
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

struct TheMovieDBNetworking {
    struct ServerResult : Codable {
        let results : [Movie]
    }
    
    private let baseURL = "https://api.themoviedb.org/3"
    
    func discoverMovies(with completion : @escaping (Result<ServerResult,Error>)->Void) {
        guard var comps = URLComponents(string: baseURL + "/discover/movie") else {
            return
        }
        
        comps.queryItems = [
            URLQueryItem(name: "sort_by", value: "popularity.desc"),
            URLQueryItem(name: "api_key", value: "e898f9a386bfdb67610421b879360e02")
        ]
        
        guard let url = comps.url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            do {
                let serverResult = try JSONDecoder().decode(ServerResult.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(serverResult))
                }
            } catch (let parseError){
                DispatchQueue.main.async {
                    completion(.failure(parseError))
                }
            }
            
        }.resume()
    }
}
