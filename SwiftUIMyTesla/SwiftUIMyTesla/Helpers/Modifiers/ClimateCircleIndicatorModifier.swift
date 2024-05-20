//
//  ClimateCircleIndicatorModifier.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct ClimateCircleIndicatorModifier: ViewModifier {
    var gradient = LinearGradient(
        colors: [
            .circleButtonGradientTop,
                .circleButtonGradientBottom
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .circleButtonGradientTop, radius: 20, x: -10, y: -10)
            .shadow(color: .lockedGradientMiddle.opacity(0.7), radius: 20, x: 20, y: 20)
            
    }
}

