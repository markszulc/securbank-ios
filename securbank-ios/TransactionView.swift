//
//  TransactionView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 2/7/2023.
//

import SwiftUI

struct TransactionView: View {
    var name: String = "name"
    var icon: String = "shop_icon"
    var date: String = "0/0/00"
    var amount: String = "$0"

    
    var body: some View {
        HStack {
            Image(icon)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.custom("AdobeClean-Regular", size: 18))
                Text(date)
                    .font(.custom("AdobeClean-Regular", size: 14))
                    .foregroundColor(Color("sb_grey"))
            }
            Spacer()
            Text(amount)
                .font(.custom("AdobeClean-ExtraBold", size: 18))
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
