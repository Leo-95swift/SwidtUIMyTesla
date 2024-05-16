//
//  NavigationBarView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 16.05.24.
//

import SwiftUI

struct NavigationBarView: View {
    var headerText: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        HStack {
            Spacer()

            Button {
                dismiss()
            } label: {
                Image("backButton")
                    .renderingMode(.template)
                    .tint(.navigationButton)
                    .frame(width: 13, height: 22)
                    .scaledToFit()
                    .circleButtonImageConfiguration()
                    .overlay {
                        Circle()
                            .stroke(circleGradient, lineWidth: 2.5)
                    }

            }
            .circleButtonConfiguration()
            Spacer()
                .frame(width: 60)
            Text(headerText)
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
            Spacer()
                .frame(width: 60)
            Button {
                print("settings tapped")
            } label: {
                Image("settingsImage")
                    .resizable()
                    .renderingMode(.template)
                    .tint(.navigationButton)
                    .frame(width: 22, height: 22)
                    .circleButtonImageConfiguration()
                    .overlay {
                        Circle()
                            .stroke(circleGradient, lineWidth: 2.5)
                    }
            }
            .circleButtonConfiguration()
            Spacer()

        }
    }
    
    private var circleGradient: LinearGradient {
        LinearGradient(colors: [.lockedGradientMiddle.opacity(0.5), .circleButtonGradientTop.opacity(0.6)], startPoint: .topLeading
                       , endPoint: .bottomTrailing)
    }
    
}
