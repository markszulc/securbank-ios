//
//  SettingsView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 2/7/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.custom("AdobeClean-ExtraBold", size: 18))
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
