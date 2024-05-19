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
        
        // Левая нижная точка
        path.move(to: CGPoint(
            x: rect.minX + 40,
            y: rect.maxY
        ))
        
        // на лево и на верх
        path.addQuadCurve(
            to: CGPoint(
                x: 0,
                y: rect.midY
            ),
            control: CGPoint(
                x: rect.minX,
                y: rect.midY + rect.midY / 2
            ))
        
        // на право и на верх
        path.addQuadCurve(
            to: CGPoint(
                x: rect.minX + 40,
                y: rect.minY
            ), control: CGPoint(
                x: rect.minX,
                y: rect.minY + 10
            ))
        
        // levaya tochka pered dugoi
        path.addQuadCurve(
            to: CGPoint(
                x: rect.minX + 120,
                y: rect.minY
            ), control: CGPoint(
                x: rect.minX + 200,
                y: rect.minY
            ))
        
        // дуга вниз
        path.addQuadCurve(
            to: CGPoint(
                x: rect.maxX - 120,
                y: rect.minY
            ),
            control: CGPoint(
                x: rect.midX,
                y: rect.minY + 80 // Положение контрольной точки для дуги вниз
            )
        )
        
        // правая верхняя точка
            path.addQuadCurve(
                to: CGPoint(
                    x: rect.maxX - 40,
                    y: rect.minY
                ),
                control: CGPoint(
                    x: rect.maxX - 120,
                    y: rect.minY
                )
            )
            
            // на право и вниз
            path.addQuadCurve(
                to: CGPoint(
                    x: rect.maxX,
                    y: rect.midY
                ),
                control: CGPoint(
                    x: rect.maxX,
                    y: rect.minY + 10
                )
            )
            
            // на лево и вниз
            path.addQuadCurve(
                to: CGPoint(
                    x: rect.maxX - 40,
                    y: rect.maxY
                ),
                control: CGPoint(
                    x: rect.maxX,
                    y: rect.midY + rect.midY / 2
                )
            )
            
            // замыкаем путь
            path.closeSubpath()
            
            return path
        
//        //pravaya tochka pered dugoi & control - radius centralnoy dugi
//        path.addQuadCurve(to: CGPoint(x: rect.midX + 47, y: rect.minY + 10), control: CGPoint(x: rect.midX, y: rect.minY + 60))
//        
//        //pravaya verhnyaya tochka
//        path.addQuadCurve(to: CGPoint(x: rect.maxX - 40, y: rect.minY + 2), control: CGPoint(x: rect.midX + 60, y: rect.minY - 5))
//        
//        // pravaya srednyaya tochka
//        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY + 5), control: CGPoint(x: rect.maxX + 10, y: rect.minY + 20))
//        
//        // pravvaya niznyaya tochka s prostranstov
//        path.addQuadCurve(to: CGPoint(x: rect.maxX - 30, y: rect.maxY), control: CGPoint(x: rect.maxX - 5, y: rect.maxY - 15))
        
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
