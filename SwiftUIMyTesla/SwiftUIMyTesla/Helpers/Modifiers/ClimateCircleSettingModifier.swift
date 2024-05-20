//
//  ClimateCircleSettingModifier.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct ClimateCircleSettingModifier: ViewModifier {
     var climateBackgroundGradient: LinearGradient {
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
    
    func body(content: Content) -> some View {
        content
            .padding(.all, 15)
            .background(Circle().fill(climateBackgroundGradient))
            .shadow(color: .circleButtonGradientTop, radius: 5, x: -5, y: -5)
            .shadow(color: .lockedGradientMiddle, radius: 5, x: 5, y: 5)
            
    }
}
