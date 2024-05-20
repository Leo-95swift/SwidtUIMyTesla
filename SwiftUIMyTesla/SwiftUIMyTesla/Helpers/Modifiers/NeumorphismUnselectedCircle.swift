//
//  NeumorphismUnselectedCircle.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct NeumorphismUnselectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 15)
            .background(Circle()
                .fill(.mainBackground))
            .neumorphismUnselectedStyle()
    }
}
