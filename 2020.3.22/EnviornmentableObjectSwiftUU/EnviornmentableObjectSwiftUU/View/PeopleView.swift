//
//  PeopleView.swift
//  EnviornmentableObjectSwiftUU
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct PeopleView: View {
    @EnvironmentObject var dataManager : DataManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.people) { person in
                    PersonView(person: person)
                }
            }
            .navigationBarTitle("People", displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: CreatePersonView(), label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
