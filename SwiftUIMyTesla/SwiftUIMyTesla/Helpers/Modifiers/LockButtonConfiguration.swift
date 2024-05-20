//
//  LockButtonConfiguration.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct lockButtonConfiguration: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 3)
            .background(Circle()
                .fill(.darkShadow)
            )
    }
}
