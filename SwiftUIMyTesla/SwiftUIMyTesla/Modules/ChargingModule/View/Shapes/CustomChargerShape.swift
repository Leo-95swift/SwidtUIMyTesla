//
//  CustomChargeProgressView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 16.05.24.
//

import SwiftUI

struct CustomChargerShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height

        // Начальная точка
        path.move(to: CGPoint(x: 0, y: height))
        
        // Движение вверх на половину
        path.addLine(to: CGPoint(x: 0, y: height / 2))
        // движение вверх и на право
        path.addLine(to: CGPoint(x: 10, y: 0))

        // на право
        path.addLine(to: CGPoint(x: width - 10, y: 0))

        // на право и в низ
        path.addLine(to: CGPoint(x: width, y: height / 2))

        // в низ
        path.addLine(to: CGPoint(x: width, y: height))

        // назад
        path.closeSubpath()
        
        return path
    }
}
