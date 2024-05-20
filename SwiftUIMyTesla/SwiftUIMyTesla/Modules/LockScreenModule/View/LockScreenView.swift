//
//  LockScreenView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 13.05.24.
//

import SwiftUI

struct LockScreenView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.easeInOut(duration: 1.7)) {
                                splashScreenOpacity = 0.0
                            }
                        }
                    }
                    .opacity(splashScreenOpacity)
                    .zIndex(1)
                backgroundStackView {
                    VStack {
                        HStack {
                            Spacer()
                                .frame(height: 100)
                            settingsButtonView
                            Spacer()
                                .frame(width: 30)
                        }
                        Spacer()
                            .frame(height: 50)
                        welcomeTextView
                        if shouldUnlockCar {
                            openedCarView
                        } else {
                            closedCarView
                        }
                        Spacer()
                        closeCarControlView
                        Spacer()
                            .frame(height: 100)
                    }
                }
                .navigation(destination: MainTabView(), isActive: $shouldNavigateToTabView)
            }
        }
    }
    
    @State private var splashScreenOpacity: Double = 1
    @State private var shouldUnlockCar = false
    @State private var shouldNavigateToTabView = false

    private var closeCarControlView: some View {
        Button {
            withAnimation(.easeIn(duration: 1)) {
                shouldUnlockCar.toggle()
            }
        } label: {
            HStack {
                Text(shouldUnlockCar ? "Lock" : "Unlock")
                    .font(.system(size: 17, weight: .semibold))
                    .frame(width: 56)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Image(shouldUnlockCar ? "openedLock" : "closedLock")
                    .padding()
                    .overlay {
                        Circle()
                            .stroke(.lockButtonGradientTop, lineWidth: 2)
                    }
                    .background(
                        Circle()
                            .fill(
                                unlockedBackgroundGradient
                                    .shadow(.inner(color: .settingsButton, radius: 1, x: -0.5, y: -0.5))
                                    .shadow(.inner(color: .lockBackground, radius: 5, x: 5, y: 5))
                            )
                    )
                    .lockImageConfiguration()
            }
            .padding()
        }
        .frame(width: 190)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(
                    .lockButtonGradientTop
                        .shadow(.inner(color: .lockedGradientTop, radius: 6, x: -10, y: -10))
                        .shadow(.inner(color: .lockedGradientMiddle, radius: 5, x: 5, y: 0))
                )
        )

    }
    
    private var settingsButtonView: some View {
        Button {
                shouldNavigateToTabView.toggle()
        } label: {
            Image("settingsImage")
                .resizable()
                .renderingMode(.template)
                .tint(shouldUnlockCar ? .settingsButton : .gray)
                .frame(width: 22, height: 22)
                .circleButtonImageConfiguration()
                .overlay {
                    Circle()
                        .stroke(settingsGradient, lineWidth: 2.5)
                }

        }
        .circleButtonConfiguration()
        .disabled(!shouldUnlockCar)
    }
    
    private var welcomeTextView: some View {
        VStack(spacing: 10) {
            Text("Hi")
                .foregroundColor(.gray)
            Text("Welcome back")
                .font(.system(size: 32, weight: .bold))
        }
        .opacity(shouldUnlockCar ? 1 : 0)
    }
    
    private var closedCarView: some View {
        Image(.lockedCar)
            .resizable()
            .frame( height: 280)
            .offset(y: -45)
            .frame(maxWidth: .infinity, maxHeight: 330)
    }
    
    private var openedCarView: some View {
        Image(.unlockedCar)
            .resizable()
            .frame( height: 310)
            .offset(x: 5)
            .frame(maxWidth: .infinity, maxHeight: 330)
            .shadow(color: .topGradient.opacity(0.3),  radius: 100, y: -50)
    }
    
    private var lockedBackgroundGradient: LinearGradient {
        LinearGradient(
            colors: [
                .lockedGradientTop,
                    .lockedGradientMiddle,
                    .lockedGradientBottom
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var unlockedBackgroundGradient: LinearGradient {
        LinearGradient(
            colors: [
                .unlockedGradientTop,
                    .unlockedGradientBottom
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var settingsGradient: LinearGradient {
        LinearGradient(
            colors: [
                .lockedGradientMiddle.opacity(0.5),
                    .circleButtonGradientTop.opacity(0.6)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        
    }
    
    private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
         ZStack {
             Rectangle()
                 .fill(shouldUnlockCar ? unlockedBackgroundGradient : lockedBackgroundGradient)
                 .frame(maxWidth: .infinity, maxHeight: .infinity)
                 .ignoresSafeArea()
             content()
         }
     }
}

#Preview {
    LockScreenView()
        .environment(\.colorScheme, .dark)
}
