//
//  HomeView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 23/6/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                HStack(alignment:.center, spacing: 40, content: {
                    Spacer()
                    Image("sblogo").resizable()
                        .frame(width:117, height: 41)
                        .padding(.bottom, 15)
                    Spacer()
                })
                
                Text("Hello, Mark")
                    .font(.custom("AdobeClean-Black", size: 30))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 10)
                
                Text("ACCOUNT BALANCE")
                    .font(.custom("AdobeClean-ExtraBold", size: 16))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .foregroundColor(Color("sb_grey"))
                
                AccountDetailsView()
                    .padding(10)
                
                Text("LATEST TRANSACTIONS")
                    .font(.custom("AdobeClean-ExtraBold", size: 16))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .foregroundColor(Color("sb_grey"))
                
                TransactionsView()
                    .padding(10)
                
                Text("OFFERS FOR YOU")
                    .font(.custom("AdobeClean-ExtraBold", size: 16))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .foregroundColor(Color("sb_grey"))
                
                OfferView()
                
                Text("EXPENSES")
                    .font(.custom("AdobeClean-ExtraBold", size: 16))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .foregroundColor(Color("sb_grey"))
                
                ExpensesView()
                    .padding(10)
                
            }
        }
        .refreshable {
            //  await viewModel.refresh()
            }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


