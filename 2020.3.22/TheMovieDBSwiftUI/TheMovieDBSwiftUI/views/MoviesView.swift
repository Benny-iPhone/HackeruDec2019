//
//  MoviesView.swift
//  TheMovieDBSwiftUI
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviesView: View {
    @EnvironmentObject var dataManager : DataManager
    
    var body: some View {
        List {
            ForEach(dataManager.movies) { movie in
                //image     title
                //image     overview
                HStack {
                    WebImage(url: movie.posterURL)
                        .indicator(.activity)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 200)
                    VStack(alignment: .leading) {
                        Text(movie.title).fontWeight(.bold)
                        Text(movie.overview)
                    }
                }
            }
        }.onAppear {
            self.dataManager.fetchData()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
