//
//  ChargingView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 16.05.24.
//

import SwiftUI

struct ChargingView: View {
    
    // MARK: - Constants
    
    enum Constants {
        
        enum Texts {
            static let navigationTitle = "Charging"
            static let carChargingImage = "carCharging"
        }
    }
    
    let timer = Timer
        .publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // MARK: - Body
    
    var body: some View {
        backgroundStackView(color: chargingBackgroundGradient) {
            ZStack {
                VStack {
                    Spacer()
                        .frame(height: 60)
                    NavigationBarView(
                        headerText: Constants.Texts.navigationTitle,
                        isTapped: $isSettingsTapped
                    )
                    Image(Constants.Texts.carChargingImage)
                        .frame(height: 170)
                    VStack(spacing: 50) {
                        CustomProgressView(progress: $progress)
                            .onReceive(timer) { _ in
                                if progress < floor(chargeLimit) {
                                    progress += 1
                                }
                            }
                        VStack(spacing: 30) {
                            sliderView
                                .frame(width: 274)
                            Text("Set Charge Limit")
                                .foregroundColor(.textGray)
                        }
                        .frame(height: 70)
                    }
                    .padding()
                    Spacer()
                        .frame(height: 10)
                    superchargersDropListView
                    Spacer()
                }
                .frame(height: UIScreen.main.bounds.height)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - @States
    
    @State private var isSettingsTapped = false
    @State private var isExpanded = false
    @State private var firstOpacity: Double = 0
    @State private var secondOpacity: Double = 0
    @State private var progress: Double = 75.0
    @State private var chargeLimit: Double = 80.0
    
    // MARK: - Visual Elements
    
    private var sliderView: some View {
        VStack(spacing: 10) {
            CustomSlider(value: $chargeLimit)
        }
    }

    private var chargingBackgroundGradient: LinearGradient {
        LinearGradient(
            colors: [
                .lockButtonGradientBottom,
                .unlockedGradientTop,
                .unlockedGradientBottom
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var superchargersDropListView: some View {
        RoundedRectangle(cornerRadius: 45)
            .fill(
                .dropMenu.opacity(0.5)
                .shadow(.inner(color: .black.opacity(0.8), radius: 7, x: 5, y: 5))
                    .shadow(.inner(color: .dropMenuButtonGradientTop.opacity(1), radius: 10, x: -5, y: -5))
            )
            .frame(width: 330, height: isExpanded ? 370 : 150)
            .animation(.easeInOut(duration: 0.7), value: isExpanded)
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 45)
                    HStack() {
                        Text("Nearby Superchargers")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                        Button {
                            withAnimation {
                                isExpanded.toggle()
                                animateChargingStationsView()
                            }
                        } label: {
                            Image(isExpanded ? "expanded" : "collapsed")
                                .renderingMode(.template)
                                .tint(.white)
                                .frame(width: 13, height: 22)
                                .scaledToFit()
                                .dropMenuCircleButtonConfiguration()
                                .overlay {
                                    Circle()
                                        .stroke(.dropMenuButtonGradientBottom.opacity(0.5), lineWidth: 2)
                                }
                            Spacer()
                                .frame(width: 10)
                        }
                    }
                    Spacer()
                    VStack {
                        if isExpanded {
                            superchargersStationsView
                        }
                    }
//                    .animation(.linear(duration: 1), value: isExpanded)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
    }
    
    private func animateChargingStationsView() {
        if isExpanded {
            withAnimation(.easeIn(duration: 0.5)) {
                firstOpacity = 1
            }
            withAnimation(.easeIn(duration: 0.5).delay(0.5)) {
                secondOpacity = 1
            }
        } else {
            withAnimation(.linear(duration: 0.1)) {
                secondOpacity = 0
                
            }
            withAnimation(.linear(duration: 0.1)) {
                firstOpacity = 0
            }
        }

    }
    
    private var backgroundGradient: LinearGradient {
        LinearGradient(colors: [.lockButtonGradientBottom, .unlockedGradientTop, .unlockedGradientBottom], startPoint: .top, endPoint: .bottom)
    }
    
    private var superchargersStationsView: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Tesla Supercharger - \nKhabarovsk, KHV")
                        .foregroundColor(.white.opacity(0.7))
                        .fontWeight(.semibold)
                    Text("4")
                        .foregroundColor(.white)
                    +
                    Text(" / 4 available")
                        .foregroundColor(.gray)
                }
                Spacer()

                VStack(alignment: .center) {
                    Image("mapPoint")
                    Text("1.3 km")
                        .foregroundColor(.white.opacity(0.7))
                }
                .frame(width: 70)

            }
            .opacity(firstOpacity)
            Spacer()
                .frame(height: 40)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Tesla Supercharger - \nVladivostok, VLD")
                        .foregroundColor(.white.opacity(0.7))
                        .fontWeight(.semibold)
                    Text("1")
                        .foregroundColor(.white)
                    +
                    Text(" / 5 available")
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .center) {
                    Image("mapPoint")
                    Text("842 km")
                        .foregroundColor(.white.opacity(0.7))
                }
                .frame(width: 70)
            }
            .opacity(secondOpacity)
            Spacer()
                .frame(height: 0)

        }
    }
    
}

#Preview {
    ChargingView()
}
