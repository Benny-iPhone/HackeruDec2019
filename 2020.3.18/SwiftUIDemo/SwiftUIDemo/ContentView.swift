//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Teacher on 18/03/2020.
//  Copyright © 2020 hackeru. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var password = ""
    
    var body: some View {
        ZStack{
            Color.green
            VStack(spacing: 24) {
                Spacer().frame(height: 20)
                HStack {
                    Text("Hello")
                        .font(.headline)
                        .foregroundColor(.red)
                    Text("World!")
                        .font(.largeTitle)
                        .underline()
                    Text("🙂")
                }
                SecureField("Type Password", text: $password)
                Text("Second Line")
                HStack {
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    Spacer()
                }
            }.background(Color.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
