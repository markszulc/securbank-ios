//
//  AccountDetailsView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 23/6/2023.
//

import SwiftUI

struct AccountDetailsView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("$1,920.00")
                .font(.custom("AdobeClean-ExtraBold", size: 30))
                .multilineTextAlignment(.leading)
                .lineLimit(0)
                .padding(.all, 10.0)
                .frame(maxWidth: .infinity)
            Spacer()
        }
        .frame(height: 165.0)
        .background(Color("sb_lightgrey"))
        
            
        
    }
}

struct AccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailsView()
    }
}
