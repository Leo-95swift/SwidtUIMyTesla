//
//  SplashScreenView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 20.05.24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var opacity: Double = 0
    @State private var scale: CGFloat = 1

    var body: some View {
        ZStack {
            Color.lockButtonGradientTop
                .ignoresSafeArea()
            TeslaLogoForm()
                .frame(width: 300, height: 280)
                .foregroundStyle(.linearGradient(
                    colors: [
                        .chargeGradientStart,
                        .chargeGradientEnd
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .teslaShadowConfiguration()
                .opacity(opacity)
        }
        .onAppear {
            withAnimation(.easeIn(duration: 1.5)) {
                opacity = 1
            }
        }
    }
}

#Preview {
    SplashScreenView()
        .environment(\.colorScheme, .dark)
}

