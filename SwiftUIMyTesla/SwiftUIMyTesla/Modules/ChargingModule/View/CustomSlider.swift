//
//  CustomSlider.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 16.05.24.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    @State private var sliderWidth: CGFloat = 0
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            let knobWidth: CGFloat = 30
            let availableWidth = geometry.size.width - knobWidth
            
            ZStack {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 9)
                
                // Himnakan
                HStack {
                    triangleView
                        .offset(x: 15 + CGFloat(value / 100) * availableWidth - knobWidth / 2)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let newValue = gesture.location.x / availableWidth * 100
                                    value = min(max(newValue, 0), 100)
                                }
                        )
                    Spacer()
                }
                .frame(width: geometry.size.width)
                
                // tokosneri hamar
                HStack {
                    percentView
                        .offset(x: 15 + CGFloat(value / 100) * availableWidth - 100 / 2, y: -30)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let newValue = gesture.location.x / availableWidth * 100
                                    value = min(max(newValue, 0), 100)
                                }
                        )
                    Spacer()
                }
                .frame(width: geometry.size.width)
                
                fullChargedView
            }
            .frame(width: 274, height: 40)
        }
    }
    
    // MARK: - Visual Elements
    
    private var percentView: some View {
            ZStack {
                Text("\(Int(value))%")
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .frame(width: 100, height: 40)
                    .background(Color.clear)
                
                Rectangle()
                    .frame(width: 3, height: 12)
                    .offset(x: -4, y: -20)
                    .foregroundStyle(.linearGradient(
                        colors: [
                            .chargeGradientStart,
                            .chargeGradientEnd
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                    )
            }
    }
    
    private var triangleView: some View {
        
        Image(systemName: "triangle.fill")
            .resizable()
            .foregroundStyle(.linearGradient(
                colors: [
                    .chargeGradientStart,
                    .chargeGradientEnd
                ],
                startPoint: .top,
                endPoint: .bottom)
            )
            .frame(width: 24, height: 18)
    }
    
    private var fullChargedView: some View {
        ZStack {
            Text("100%")
                .foregroundColor(.textGray)
            
            Rectangle()
                .frame(width: 3, height: 12)
                .offset(x: -4, y: -20)
                .opacity(0.6)
                .foregroundStyle(.linearGradient(
                    colors: [
                        .chargeGradientStart,
                        .chargeGradientEnd
                    ],
                    startPoint: .top,
                    endPoint: .bottom))
        }
        .offset(x: 143, y: -30)
    }
    
}
