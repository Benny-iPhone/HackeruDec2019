//
//  CreatePersonView.swift
//  EnviornmentableObjectSwiftUU
//
//  Created by Teacher on 22/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct CreatePersonView: View {
    
    @EnvironmentObject var dataManager : DataManager
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
        
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.callout)
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.callout)
            Button(action: {
                
                let p = Person(firstName: self.firstName, lastName: self.lastName)
                self.dataManager.add(person: p)
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                Text("Create New Person")
                    .padding()
                    .font(.headline)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(24)
                    
                
            }
                
            Spacer()
            
        }
        .padding()
        .navigationBarTitle("Create Person")
    }
}

struct CreatePersonView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePersonView()
    }
}
