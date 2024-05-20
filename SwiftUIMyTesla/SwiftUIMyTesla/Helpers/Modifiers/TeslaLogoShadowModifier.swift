//
//  TeslaLogoShadowModifier.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct TeslaLogoShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .pink, radius: 45, x: 0, y: 10)
    }
}
