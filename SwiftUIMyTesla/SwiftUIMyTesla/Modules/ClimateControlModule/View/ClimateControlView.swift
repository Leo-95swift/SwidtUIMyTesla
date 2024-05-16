//
//  ClimateControlView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct ClimatControlView: View {
    
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    
    @State var startColor = Color.start
    @State var endColor = Color.end
    
    @State private var acClimate: Double = 24.0
    @State private var fanClimate: Double = 0.0
    @State private var heatClimate: Double = 0.0
    @State private var autoClimate: Double = 0.0
    
    @State private var isACOn: Bool = true
    
    var body: some View {
        ZStack {
            mainView
                .ignoresSafeArea(edges: .top)
            bottomSheetView
                .padding()
                .frame(height: UIScreen.main.bounds.height + 250)
                .background(RoundedRectangle(cornerRadius: 20).fill(.alert))
                .ignoresSafeArea(.all, edges: .bottom)
                .offset(y: UIScreen.main.bounds.height)
                .offset(y: currentMenuOffsetY)
                .gesture(dragGesture)
        }
        .navigationBarBackButtonHidden(true)
    }

    
    private var mainView: some View {
        VStack {
            ZStack {
                Color(.lockButtonGradientTop)
                
                VStack(spacing: 5) {
                    Text("Climate")
                        .font(.title)
                        .foregroundColor(.textGray)
                        .padding()
                    displayView
                    DisclosureGroup {
                        VStack(spacing: 0) {
                            acSliderView
                            fanSliderView
                            heatSliderView
                        }
                        
                    } label: {
                        Text("Climate control")
                            .foregroundColor(.textGray)
                    }.padding()
                    Spacer()
                }
            }
        }.padding(.top, 200)
    }
    
    private var bottomSheetView: some View {
        VStack {
            bottomSheetHeaderView
            controlButtonsView
            colorsSelecterView
            Spacer()
        }
    }
    
    private var displayView: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat((acClimate - 16) / 24))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .foregroundColor(acClimate < 24 ? startColor : endColor
                )
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(Int(acClimate))° C")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
        }
        .frame(width: 200, height: 200)
        .padding(50)
    }
    
    private var acSliderView: some View {
            HStack {
                Text("A/C")
                    .foregroundColor(.textGray)
                
                Button {
                    
                } label: {
                    Image(.acIcon)
                }

                Slider(value: $acClimate, in: 16...40, step: 1)
                    .accentColor(acClimate < 24 ? startColor : endColor)
                    .padding()
                    
        }
        .foregroundColor(.textGray)
    }
    
    private var fanSliderView: some View {
            HStack {
                Text("Fan")
                    .foregroundColor(.textGray)
                
                Button {
                    
                } label: {
                    Image(.fanIcon)
                }

                Slider(value: $fanClimate, in: 16...40, step: 1)
                    .padding()
                    
        }
        .foregroundColor(.textGray)
    }
    
    private var heatSliderView: some View {
            HStack {
                Text("Heat")
                    .foregroundColor(.textGray)
                
                Button {
                    
                } label: {
                    Image(.heatIcon)
                }

                Slider(value: $heatClimate, in: 16...40, step: 1)
                    .padding()
                    
        }
        .foregroundColor(.textGray)
    }

    private var bottomSheetHeaderView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.clear)
                .frame(height: 100)
                .cornerRadius(20)
                .padding(.horizontal)
            HStack(spacing: 50) {
                VStack(alignment: .leading) {
                    Text("A/C is On")
                        .foregroundColor(.white)
                    Text("Tap to turn off or swipe down")
                        .foregroundColor(.gray)
                }
                Button {
                    
                } label: {
                    Image(systemName: "power")
                        .frame(width: 60, height: 60)
                        .tint(.white)
                        .overlay {
                            Circle()
                                .stroke(.topGradient.opacity(0.6), lineWidth: 2)
                        }
                        .background(
                            Circle()
                                .fill(
                                    .topGradient
                                        .shadow(.inner(color: .blue, radius: 12, x: 15, y: 10))
                                        .shadow(.inner(color: .blue, radius: 10, x: -1, y: -5))
                                )
                            
                        )
                }
            }
        }
    }
    
    private var controlButtonsView: some View {
        // Кнопки контроля
        
        HStack(spacing: 30) {
            // on - off
            VStack(spacing: 30) {
                Button {
                    
                } label: {
                    Image(.power)
                }
                
                Text("On")
                    .foregroundColor(.gray)
            }
            
            // цельсус
            
            HStack(spacing: 20) {
                Button {
                    acClimate -= 1
                } label: {
                    Image(.left)
                }
                
                Text("\(Int(acClimate))° C")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                
                Button {
                    acClimate += 1
                } label: {
                    Image(.right)
                }
            }
            
            // vent
            VStack(spacing: 30) {
                Button {
                    
                } label: {
                    Image(.vent)
                }
                
                Text("Vent")
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var colorsSelecterView: some View {
        HStack {
            VStack {
                ColorPicker("", selection: $startColor)
                Text("Start color")
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
            }
            
            VStack {
                ColorPicker("", selection: $endColor)
                Text("End color")
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
            }
        }
    }
    
    
    var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { value in
                let maxHeight = UIScreen.main.bounds.height / 3.0
                
                withAnimation {
                    if -currentMenuOffsetY > maxHeight / 2 {
                        currentMenuOffsetY = -maxHeight
                    } else {
                        currentMenuOffsetY = 0
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
    }
    
    private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            self.currentMenuOffsetY = gestureOffset.height + lastMenuOffsetY
        }
    }
    
}

#Preview {
    ClimatControlView()
}
