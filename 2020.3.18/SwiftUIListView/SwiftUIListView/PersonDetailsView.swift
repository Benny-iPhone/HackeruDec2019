//
//  PersonDetailsView.swift
//  SwiftUIListView
//
//  Created by Teacher on 18/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct PersonDetailsView: View {
    var p : Person
    var body: some View {
        VStack {
            Text(p.email)
        }.navigationBarTitle(p.fullname)
    }
}

struct PersonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsView(p: Person.demoPeople[0])
    }
}
