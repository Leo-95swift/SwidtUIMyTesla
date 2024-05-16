//
//  CircleButtonModifier.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct CircleButtonModifier: ViewModifier {
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
            .shadow(
                color: .circleButtonGradientTop,
                radius: 10,
                x: 0,
                y: 0
            )
            .shadow(
                color: .lockedGradientMiddle.opacity(0.8),
                radius: 8,
                x: 6,
                y: 9
            )
    }
}

