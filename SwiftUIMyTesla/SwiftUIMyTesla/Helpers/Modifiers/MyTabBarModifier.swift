//
//  MyTabBarModifier.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct MyTabBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lockedGradientTop, radius: 5, x: 0, y: -5)
            .shadow(color: .lockedGradientMiddle.opacity(1), radius: 3, x: 0, y: 5)
    }
}
