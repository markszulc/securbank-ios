//
//  TransactionsView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 24/6/2023.
//

import SwiftUI

struct TransactionsView: View {
    var body: some View {
        Text("There are no transactions")
            .font(.custom("AdobeClean-Regular", size: 16))
            .multilineTextAlignment(.leading)
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}

struct Transactions: Hashable, Codable {
    let name: String
    let category: String
    let amount: String
    let date: String
}
