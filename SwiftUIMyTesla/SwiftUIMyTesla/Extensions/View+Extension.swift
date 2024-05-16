//
//  View+Extension.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

/// Заготовленные стили для вью
extension View {
    
    func backgroundStackView<Content: View, S: ShapeStyle>(color: S, content: () -> Content) -> some View {
       ZStack {
           Rectangle()
               .fill(color)
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .ignoresSafeArea(.all)
           content()
       }
   }
    
    func neumorphismUnselectedStyle() -> some View {
        modifier(NeumorphismUnselected())
    }
    
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    
    func neumorphismCircleStyle() -> some View {
        modifier(NeumorphismUnselectedCircle())
    }
    
    func circleButtonImageConfiguration() -> some View {
        modifier(CircleButtonImageModifier())
    }
    
    func circleButtonConfiguration() -> some View {
        modifier(CircleButtonModifier())
    }
    
    func lockImageConfiguration() -> some View {
        modifier(lockButtonConfiguration())
    }
}
