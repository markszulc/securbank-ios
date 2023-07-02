//
//  TransactionsView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 24/6/2023.
//

import SwiftUI

struct TransactionsView: View {
    var body: some View {
        VStack {
            TransactionView(name: "Farmer's Shop", icon: "shop_icon", date: "26/06/2023", amount: "$345")
            TransactionView(name: "Mobile Bill", icon: "finance_icon", date: "26/06/2023", amount: "$95")
            TransactionView(name: "Internet Bill", icon: "finance_icon", date: "26/06/2023", amount: "$220.40")
        }
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
