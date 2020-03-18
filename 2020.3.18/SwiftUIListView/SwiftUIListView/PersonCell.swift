//
//  PersonCell.swift
//  SwiftUIListView
//
//  Created by Teacher on 18/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct PersonCell: View {
    var p : Person
    
    var body: some View {
        HStack {
            Image("icons8-anonymous_mask")
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(p.fullname)
                    Text("\(p.age)").foregroundColor(.gray)
                }
                Text(p.email)
            }
            Spacer()
            Image(systemName: "star.fill")
        }
    }
}

struct PersonCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonCell(p: Person.demoPeople[0])
    }
}
