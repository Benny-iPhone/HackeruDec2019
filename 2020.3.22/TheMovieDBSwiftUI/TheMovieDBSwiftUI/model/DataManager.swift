//
//  DataManager.swift
//  TheMovieDBSwiftUI
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import Foundation

class DataManager : ObservableObject {
    @Published var movies : [Movie] = []
    private let networking = TheMovieDBNetworking()
    
    func fetchData() {
        networking.discoverMovies { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
                self.movies = []
            case .success(let serverResult):
                self.movies = serverResult.results
            }
        }
    }
}
