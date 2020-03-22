//
//  PersonView.swift
//  EnviornmentableObjectSwiftUU
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct PersonView: View {
    let person : Person
    
    var body: some View {
        VStack {
            Text(person.firstName)
            Text(person.lastName).font(.title)
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(person: .demo)
    }
}
