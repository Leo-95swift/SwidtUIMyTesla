//
//  MainTabView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    
    var body: some View {
        CustomTabView(selection: $selectedTab) {
            VStack {
                if selectedTab == 1 {
                    ChargingView()
                } else  {
                    SettingsView()
                }
            }
            .transition(.opacity)

        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
        .environment(\.colorScheme, .dark)
}
