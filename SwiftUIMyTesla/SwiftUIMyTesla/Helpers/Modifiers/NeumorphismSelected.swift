//
//  NeumorphismSelected.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: 5, y: 5)
            .shadow(color: .darkShadow, radius: 5, x: -5, y: -5)
    }
}
