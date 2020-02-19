//
//  Networking.swift
//  SearchMovies
//
//  Created by Teacher on 19/02/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation
import Alamofire

struct Networking {
    
    enum NetworkError : Error {
        case network(error : Error)
        case serverResponse
        case unknown
    }
    
    private let baseURL = "https://api.themoviedb.org/3/"
    private let apiKey = "e898f9a386bfdb67610421b879360e02"
    
    func searchMovies(with query : String,
                      completion : @escaping (Result<[Movie],NetworkError>)->Void) {
     
        guard query.count > 0 else {
            completion(.failure(.unknown))
            return
        }
        
        let url = baseURL + "search/movie"
        let params : [String:Any] = [
            "api_key":apiKey,
            "query":query
        ]
        
        let request = AF.request(url, parameters: params)
        request.responseJSON { (response) in
            guard let json = response.value as? [String:Any] else {
                if let error = response.error {
                    completion(.failure(.network(error: error)))
                } else {
                    completion(.failure(.unknown))
                }
                return
            }
            
            guard let results = json["results"] as? [Any] else {
                completion(.failure(.serverResponse))
                return
            }
            
            let movies : [Movie] = results.compactMap{ $0 as? [String:Any] }.compactMap{ Movie($0) }
            completion(.success(movies))
            
        }
        
    }
    
}
