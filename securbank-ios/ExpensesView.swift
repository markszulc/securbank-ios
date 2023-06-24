//
//  ExpensesView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 24/6/2023.
//

import SwiftUI

struct ExpensesView: View {
    var body: some View {
        Image("stats")
            .resizable(resizingMode: .stretch)
            .frame(width: 375.0, height: 165.0)
        
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
