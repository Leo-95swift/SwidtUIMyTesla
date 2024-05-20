//
//  SettingsView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var tagSelected = 0
    @State private var shouldNavigateToClimatControlView = false
    
    var body: some View {
            backgroundStackView {
                VStack {
                    headerView
                    carView
                    controlPanelView
                    Spacer()
                        .frame(height: 40)
                    NavigationLink(
                        destination: ClimateControlView(),
                        isActive: $shouldNavigateToClimatControlView,
                        label: {}
                    )
                    Spacer()
                }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Tesla")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("187 km")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .opacity(0.4)
            }
            Spacer()
        }
        .padding(25)
    }
    
    private var carView: some View {
        Image("car")
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.6), radius: 15, x: 10, y: 10)
    }
    
    private var gradient: LinearGradient {
        LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top)
    }
    
    private var controlPanelView: some View {
            HStack(spacing: 30) {
                ForEach(1..<5) { index in
                    Button {
                        withAnimation {
                            tagSelected = index
                            switch tagSelected {
                            case 2:
                                shouldNavigateToClimatControlView.toggle()
                            default:
                                break
                            }
                        }
                    } label: {
                        Image("\(index)")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .neumorphismCircleStyle()
                            .overlay {
                                Circle()
                                    .stroke(gradient, lineWidth: 3)
                                    .opacity(tagSelected == index ? 1 : 0)
                            }
                    }
                    
                }
            }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(.mainBackground))
        .neumorphismUnselectedStyle()
    }
    
   private func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(.mainBackground)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
}

#Preview {
    SettingsView()
        .environment(\.colorScheme, .dark)
}
