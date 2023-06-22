//
//  ContentView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 21/5/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("sblogo")
            Image("sb-squares")
                .padding(.top, 60)

            Text("Don't have an acccount yet?")
                .frame(width: 400, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
