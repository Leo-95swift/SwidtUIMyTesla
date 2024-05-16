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
                        headerText: Constants.Texts.navigationTitle
                    )
                    Spacer()
                        .frame(height: 20)
                    Image(Constants.Texts.carChargingImage)
                    Spacer()
                        .frame(height: 20)
                    VStack(spacing: 50) {
                        CustomProgressView(progress: $progress)
                            .onReceive(timer) { _ in
                                if progress < floor(chargeLimit) {
                                    progress += 1
                                }
                            }
                        
                        sliderView
                            .frame(width: 274)
                        Text("Set Charge Limit")
                            .foregroundColor(.textGray)
                    }.padding()
                    Spacer()
                }
                .frame(height: UIScreen.main.bounds.height)
            }
        }
    }
    
    // MARK: - @States
    
    @State private var progress: Double = 65.0
    @State private var chargeLimit: Double = 70.0
    
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
    
}

#Preview {
    ChargingView()
}
