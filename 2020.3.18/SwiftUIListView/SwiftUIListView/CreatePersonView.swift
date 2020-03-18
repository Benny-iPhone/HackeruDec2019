//
//  CreatePersonView.swift
//  SwiftUIListView
//
//  Created by Teacher on 18/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct CreatePersonView: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    @State var fullname : String = ""
    @State var email : String = ""
    
    var callback : (Person)->Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
        
            TextField("Type Fullname", text: $fullname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.callout)
            TextField("Type Email", text: $email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.callout)
            Button(action: {
                
                let p = Person(fullname: self.fullname, email: self.email, age: Int.random(in: 10...30))
                self.callback(p)
                
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
        CreatePersonView { (p) in
            
        }
    }
}
