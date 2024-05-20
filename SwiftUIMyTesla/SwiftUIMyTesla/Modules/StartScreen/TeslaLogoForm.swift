//
//  TeslaLogoForm.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 19.05.24.
//

import SwiftUI

struct TeslaLogoForm: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        // нижняя точка верхнего триугольника буквы Т
        path.move(to: CGPoint(
            x: 0.5 * width,
            y: 0.18 * height
        ))
        
        // правая верхняя точка верхнего триугольника буквы Т
        path.addLine(to: CGPoint(
            x: 0.62319 * width,
            y: 0.09734 * height
        ))
        
        // правая верхняя точка буквы Т
        path.addCurve(to: CGPoint(
            x: 0.95606 * width,
            y: 0.19297 * height
        ), control1: CGPoint(
            x: 0.62319 * width,
            y: 0.09734 * height
        ), control2: CGPoint(
            x: 0.77994 * width,
            y: 0.10109 * height
        ))
    
        // правая нижная точка буквы Т
        path.addCurve(to: CGPoint(
            x: 0.85147 * width,
            y: 0.28453 * height
        ), control1: CGPoint(
            x: 0.95097 * width,
            y: 0.25116 * height
        ), control2: CGPoint(
            x: 0.85147 * width,
            y: 0.28453 * height
        ))
        
        // правая верхняя точка нижнего триугольника буквы Т
        path.addCurve(to: CGPoint(
            x: 0.64 * width,
            y: 0.22 * height
        ), control1: CGPoint(
            x: 0.81544 * width,
            y: 0.22463 * height
        ), control2: CGPoint(
            x: 0.77347 * width,
            y: 0.21 * height
        ))
        
        // нижная точка нижнего триугольника буквы Т
        path.addLine(to: CGPoint(
            x: 0.5 * width,
            y: 1 * height
        ))
        
        // Нижняя точка верхнего треугольника буквы Т 
        path.move(to: CGPoint(
            x: 0.5 * width,
            y: 0.18 * height
        ))
        
        // Левая верхняя точка верхнего треугольника буквы Т 
        path.addLine(to: CGPoint(
            x: 0.37681 * width,
            y: 0.09734 * height
        ))
        
        // Левая верхняя точка буквы Т
        path.addCurve(to: CGPoint(
            x: 0.04394 * width,
            y: 0.19297 * height
        ), control1: CGPoint(
            x: 0.37681 * width,
            y: 0.09734 * height
        ), control2: CGPoint(
            x: 0.22006 * width,
            y: 0.10109 * height
        ))
    
        // Левая нижняя точка буквы Т
        path.addCurve(to: CGPoint(
            x: 0.14853 * width,
            y: 0.28453 * height
        ), control1: CGPoint(
            x: 0.04903 * width,
            y: 0.25116 * height
        ), control2: CGPoint(
            x: 0.14853 * width,
            y: 0.28453 * height
        ))
        
        // Левая верхняя точка нижнего треугольника буквы Т 
        path.addCurve(to: CGPoint(
            x: 0.36 * width,
            y: 0.22 * height
        ), control1: CGPoint(
            x: 0.18456 * width,
            y: 0.22463 * height
        ), control2: CGPoint(
            x: 0.22653 * width,
            y: 0.21 * height
        ))
        
        // Нижняя точка нижнего треугольника буквы Т
        path.addLine(to: CGPoint(
            x: 0.5 * width,
            y: 1 * height
        ))
        
        path.closeSubpath()
        
        // Верхний полукруг

        path.move(to: CGPoint(
            x: 0.5 * width,
            y: 0.06103 * height
        ))
        
        path.addCurve(to: CGPoint(
            x: 0.972 * width,
            y: 0.14591 * height  
        ), control1: CGPoint(
            x: 0.64225 * width,
            y: 0.05972 * height
        ), control2: CGPoint(
            x: 0.80519 * width,
            y: 0.073 * height  
        ))
        
        path.addCurve(to: CGPoint(
            x: width,
            y: 0.09781 * height
        ), control1: CGPoint(
            x: 0.99431 * width,
            y: 0.11553 * height
        ), control2: CGPoint(
            x: width,
            y: 0.09781 * height
        ))
        
        path.addCurve(to: CGPoint(
            x: 0.5 * width,
            y: 0
        ), control1: CGPoint(
            x: 0.81772 * width,
            y: 0.02553 * height
        ), control2: CGPoint(
            x: 0.64697 * width,
            y: 0.00066 * height
        ))
        
        path.addCurve(to: CGPoint(
            x: 0,
            y: 0.09781 * height
        ), control1: CGPoint(
            x: 0.35303 * width,
            y: 0.00066 * height
        ), control2: CGPoint(
            x: 0.18228 * width,
            y: 0.02541 * height
        ))
        
        path.addCurve(to: CGPoint(
            x: 0.028 * width,
            y: 0.16609 * height  
        ), control1: CGPoint(
            x: 0,
            y: 0.09781 * height
        ), control2: CGPoint(
            x: 0.00813 * width,
            y: 0.10978 * height  
        ))
        
        path.addCurve(to: CGPoint(
            x: 0.5 * width,
            y: 0.06087 * height
        ), control1: CGPoint(
            x: 0.19484 * width,
            y: 0.07284 * height  
        ), control2: CGPoint(
            x: 0.35775 * width,
            y: 0.05975 * height
        ))
        
        path.closeSubpath()
        return path
    }
}



#Preview {
    TeslaLogoForm()
}
