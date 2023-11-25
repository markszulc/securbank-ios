//
//  MainView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 2/7/2023.
//

import SwiftUI

struct MainView: View {
    @State var username: String = UserDefaults.standard.string(forKey: "NAME_KEY") ?? ""
    

    
    var body: some View {
        NavigationStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    HStack(alignment:.center, spacing: 40, content: {
                        Image("menu").resizable()
                            .frame(width:22, height: 22)
                            .padding([.leading,.bottom], 20)
                        Spacer()
                        Image("sblogo").resizable()
                            .frame(width:117, height: 41)
                            .padding(.bottom, 15)
                        Spacer()
                        Image("avatar").resizable()
                            .frame(width:34, height: 34)
                            .padding(.trailing, 20.0)
                    })
                    
                    Text("Hello, \(username)")
                        .font(.custom("AdobeClean-Black", size: 30))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 30)
                    
                    Text("ACCOUNT BALANCE")
                        .font(.custom("AdobeClean-ExtraBold", size: 16))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                        .padding(.leading, 30)
                        .foregroundColor(Color("sb_grey"))
                    
                    AccountDetailsView()
                        .padding([.leading,.trailing],20)
                    
                    Text("LATEST TRANSACTIONS")
                        .font(.custom("AdobeClean-ExtraBold", size: 16))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                        .padding(.leading, 30)
                        .foregroundColor(Color("sb_grey"))
                    
                    TransactionsView()
                        .padding([.leading,.trailing], 20)
                    
                    Text("OFFERS FOR YOU")
                        .font(.custom("AdobeClean-ExtraBold", size: 16))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                        .padding(.leading, 30)
                        .foregroundColor(Color("sb_grey"))
                    
                    OfferView()
                    
                    Text("EXPENSES")
                        .font(.custom("AdobeClean-ExtraBold", size: 16))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 10)
                        .padding(.leading, 30)
                        .foregroundColor(Color("sb_grey"))
                    
                    ExpensesView()
                        .padding([.leading,.trailing],20)
                    
                    
                }
            }
            .refreshable {
                username = UserDefaults.standard.string(forKey: "NAME_KEY") ?? ""
                print("Refreshed Home Screen")
                print("Refreshed Offers")

                //  await viewModel.refresh()
                
            }
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
