//
//  SettingsView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 2/7/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var aemurl: String = UserDefaults.standard.string(forKey: "AEM_URL_KEY") ?? "https://publish-p55117-e571178.adobeaemcloud.com"
    @State var inputText: String = UserDefaults.standard.string(forKey: "AEM_URL_KEY") ?? "https://publish-p55117-e571178.adobeaemcloud.com"
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.custom("AdobeClean-ExtraBold", size: 18))
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
            Form {
                Section(header: Text("AEM Publish URL")) {
                    TextField("URL.", text: $inputText)
                }

                
                Section(header: Text("Actions")) {
                    Button("Save") {
                        UserDefaults.standard.set(inputText, forKey: "AEM_URL_KEY")
                    }
                    
                    
                }
            }
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
