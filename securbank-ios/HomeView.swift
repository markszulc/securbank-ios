//
//  HomeView.swift
//  securbank-ios
//
//  Created by Mark Szulc on 23/6/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                    TabView(selection: $selectedTab) {
                        MainView()
                            .tag(Tab.allCases[0])
                        ContentView()
                            .tag(Tab.allCases[1])
                        ProfileView()
                            .tag(Tab.allCases[2])
                        SettingsView()
                            .tag(Tab.allCases[3])
                    }
                }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        
        }
        
     
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


