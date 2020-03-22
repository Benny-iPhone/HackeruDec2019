//
//  ContentView.swift
//  TheMovieDBSwiftUI
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MoviesView()
                .environmentObject(DataManager())
                .navigationBarTitle("Movies", displayMode: .inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
