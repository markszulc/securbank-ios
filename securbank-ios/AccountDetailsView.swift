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
            HStack {
                VStack {
                    Text("XXXX XXXX XXXX 3487")
                        .font(.custom("AdobeClean-Regular", size: 16))
                        .lineLimit(0)
                        .padding([.top, .leading], 20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("$1,920.00")
                        .font(.custom("AdobeClean-ExtraBold", size: 30))
                        .lineLimit(0)
                        .padding(.leading, 20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Image("CreditCard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.top,.trailing], 20)
            }
            
            Button(action: {print("make transfer")}) {
                  Text("Make Transfer")
                      .frame(minWidth: 0, maxWidth: 156)
                      .font(.custom("AdobeClean-ExtraBold", size: 16))
                      .padding(10)
                      .foregroundColor(.white)
                      .overlay(
                          RoundedRectangle(cornerRadius: 25)
                              .stroke(Color.white, lineWidth: 2)
                  )
              }
              .background(Color("sb_highlight"))
              .cornerRadius(25)
              .padding(.top, 10.0)
              .padding(.leading, 20.0)
              
 
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
