//
//  ProfileView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 2/7/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var username: String = UserDefaults.standard.string(forKey: "NAME_KEY") ?? ""
    @State var interest: String = UserDefaults.standard.string(forKey: "INTEREST_KEY") ?? "None"
    @State var inputText: String = UserDefaults.standard.string(forKey: "NAME_KEY") ?? ""
    @State var selectedInterest = UserDefaults.standard.string(forKey: "INTEREST_KEY") ?? "None"
    let interests = ["None", "Student", "Family", "Investor"]
    
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
                    TextField("Add your name here.", text: $inputText)
                }

                Section {
                    Picker("Interest", selection: $selectedInterest) {
                        ForEach(interests, id: \.self) {
                            Text($0)
                        }
                    }
                   
                }
                
                Section(header: Text("Actions")) {
                    Button("Save") {
                        UserDefaults.standard.set(inputText, forKey: "NAME_KEY")
                        UserDefaults.standard.set(selectedInterest, forKey: "INTEREST_KEY")
                        username = inputText
                        interest = selectedInterest
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
