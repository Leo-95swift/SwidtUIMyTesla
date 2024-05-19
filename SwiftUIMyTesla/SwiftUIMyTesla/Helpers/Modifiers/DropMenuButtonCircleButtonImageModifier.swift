//
//  DropMenuButtonCircleButtonImageModifier.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct DropMenuButtonCircleButtonImageModifier: ViewModifier {
    var gradient = LinearGradient(
        colors: [
            .dropMenuButtonGradientTop,
            .dropMenuButtonGradientBottom
        ],
        startPoint: .top,
        endPoint: .bottom
        
    )
    func body(content: Content) -> some View {
        content
            .padding(.all, 20)
            .background(Circle().fill(gradient))
            .shadow(color: .circleButtonGradientTop.opacity(0.8), radius: 10, x: -5, y: -8)
            .shadow(color: .circleButtonGradientTop.opacity(0.7), radius: 2, x: 1, y: 1)
            .shadow(color: .lockedGradientMiddle.opacity(0.8), radius: 8, x: 3, y: 3)
        
    }
}
