//
//  ContentView.swift
//  SwiftUIListView
//
//  Created by Teacher on 18/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var people : [Person]
    
    var body: some View {
       
        NavigationView {
            List {
                ForEach(people) { p in
                    NavigationLink(destination: PersonDetailsView(p: p)) {
                        PersonCell(p: p)
                    }
                }
            }
                
            .navigationBarTitle("List Of People" ,displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: CreatePersonView(callback: { newPerson in
                    self.people.append(newPerson)
                })) {
                    Image(systemName: "plus").foregroundColor(.red)
                }
            )
            /*
             .navigationBarItems(trailing:
                Button(action: {
                    print("add button pressed")
                }) {
                    //Text("Click Me").font(.headline)
                    Image(systemName: "plus").foregroundColor(.red)
                }
            )*/
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(people: Person.demoPeople)
    }
}
