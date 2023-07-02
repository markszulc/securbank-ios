//
//  ProfileView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 2/7/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var username: String = UserDefaults.standard.string(forKey: "NAME_KEY") ?? ""
    @State var inputText: String = ""
    
    var body: some View {
        VStack {
            Text("My Profile")
                .font(.custom("AdobeClean-ExtraBold", size: 18))
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
            Image("avatar").resizable()
                .frame(width:112, height: 112)
                .padding()
            
            Form {
                Section(header: Text("Name")) {
                    TextField("Add some text here.", text: $inputText)
                }
                
                Section(header: Text("Actions")) {
                    Button("Save") {
                        UserDefaults.standard.set(inputText, forKey: "NAME_KEY")
                        username = inputText
                        print("Saved: \(inputText)")
                    }
                    
                    
                }
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
