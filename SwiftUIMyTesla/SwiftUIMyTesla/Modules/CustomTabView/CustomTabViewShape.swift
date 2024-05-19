//
//  CustomTabViewShape.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct CustomTabViewShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        
        // levaya nizhnayya tochka s prostranstvom
        path.move(to: CGPoint(x: rect.minX + 30, y: rect.maxY))
        
        // levaya nizhnyaya tochka bez prostranstva
//        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))

        
        //levaya srednyaa tochka
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.midY + 5), control: CGPoint(x: rect.minX + 5, y: height - 15))
        
        //levaay verhnyaa tochka
        path.addQuadCurve(to: CGPoint(x: rect.minX + 40, y: rect.minY + 2), control: CGPoint(x: rect.minX - 10, y: rect.minY + 20))
        
        // levaya tochka pered dugoi
        path.addQuadCurve(to: CGPoint(x: rect.midX - 47, y: rect.minY + 10), control: CGPoint(x: rect.midX - 60, y: rect.minY  - 5))
        
        //pravaya tochka pered dugoi & control - radius centralnoy dugi
        path.addQuadCurve(to: CGPoint(x: rect.midX + 47, y: rect.minY + 10), control: CGPoint(x: rect.midX, y: rect.minY + 60))
        
        //pravaya verhnyaya tochka
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 40, y: rect.minY + 2), control: CGPoint(x: rect.midX + 60, y: rect.minY - 5))
        
        // pravaya srednyaya tochka
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY + 5), control: CGPoint(x: rect.maxX + 10, y: rect.minY + 20))
        
        // pravvaya niznyaya tochka s prostranstov
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 30, y: rect.maxY), control: CGPoint(x: rect.maxX - 5, y: rect.maxY - 15))
        
        // pravvaya niznyaya tochka bez prostranstva
//        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY - 15))

        return path
    }
}


struct Show: View {
    var body: some View {
        CustomTabViewShape()
            .frame(height: 100)
    }
}

#Preview {
    Show()
}
