//
//  StartPageView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct StartPageView: View {
    
    var body: some View {
        VStack {
            // Добавляем ваш шейп в представление
            TeslaIcon()
                .frame(width: 200, height: 200) // Размер вашего шейпа
                .foregroundColor(.blue) // Цвет вашего шейпа
            
            Text("Tesla Icon") // Добавляем название или описание
        }
    }
    
}

#Preview {
    StartPageView()
}
