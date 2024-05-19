//
//  NavigationModifier.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct NavigationModifier<Destination>: ViewModifier where Destination: View {
    let destination: Destination
    let isActive: Binding<Bool>
    
    init(destination: Destination, isActive: Binding<Bool>) {
        self.destination = destination
        self.isActive = isActive
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(destination: destination, isActive: isActive) {
                    EmptyView()
                }
                    .hidden()
            )
    }
}
