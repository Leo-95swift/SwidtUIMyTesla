//
//  CircleButtonImageModifier.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct CircleButtonImageModifier: ViewModifier {
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
            .padding(.all, 20)
            .background(Circle()
                .fill(gradient))
            .shadow(
                color: .circleButtonGradientTop.opacity(1),
                radius: 10,
                x: -4,
                y: -8
            )
            .shadow(
                color: .lockedGradientMiddle.opacity(0.8),
                radius: 10,
                x: 3,
                y: 2
            )
    }
}
