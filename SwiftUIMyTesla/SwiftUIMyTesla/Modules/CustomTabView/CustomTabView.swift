//
//  CustomTabView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct CustomTabItem: Identifiable, Equatable {
    var id = UUID()
    var icon: String
}

struct CustomTabView<Content: View>: View {
    @Binding var selection: Int
    
    @Namespace private var tabBarItem
    
    private var tabs: [CustomTabItem] = [
        .init(icon: "carIcon"),
        .init(icon: "flash"),
        .init(icon: "antenna"),
        .init(icon: "profile")
    ]
    
    private var content: Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            tabsView
        }
    }
    
    init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _selection = selection
    }
    
    private var tabsView: some View {
        ZStack {
            CustomTabViewShape()
                .fill(.climateIndicatorGradientDark)
                .tabBarShadowConfiguration()
            HStack(spacing: 40) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
                    Image(element.icon)
                        .renderingMode(.template)
                        .foregroundColor(selection == index ? .topGradient : .white)
                        .frame(width: 40, height: 40)
                        .background(
                            ZStack {
                                if selection == index {
                                    Circle()
                                        .stroke(lineWidth: 5)
                                        .fill(
                                            .topGradient.opacity(0.7)
                                        )
                                        .frame(width: 50, height: 50)
                                        .matchedGeometryEffect(id: "tabBarItem", in: tabBarItem)
                                        .shadow(color: .topGradient.opacity(1), radius: 20, x: 0, y: 0)
                                        .transition(.scale)
                                }
                            }
                                .shadow(color: .topGradient, radius: 10, x: 0, y: 0)
                        )
                        .onTapGesture {
                            withAnimation {
                                selection = index
                            }
                        }
                    if index == 1 {
                        Spacer()
                            .frame(width: 40)
                    }
                }
            }
        }
        .frame(height: 100)
    }
}





struct CustomTabViewExample2: View {
    @State private var selected = 0
    
    var body: some View {
        CustomTabView(selection: $selected) {
            Color.climateIndicatorGradientLight
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CustomTabViewExample2()
}
