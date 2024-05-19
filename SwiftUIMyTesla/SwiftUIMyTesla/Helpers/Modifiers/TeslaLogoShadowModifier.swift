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
            .shadow(color: .black, radius: 25, x: 0, y: 0)
    }
}
