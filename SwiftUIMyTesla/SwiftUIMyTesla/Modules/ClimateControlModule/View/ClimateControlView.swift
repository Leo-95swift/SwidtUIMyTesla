//
//  ClimateControlView.swift
//  SwiftUIMyTesla
//
//  Created by Levon Shaxbazyan on 15.05.24.
//

import SwiftUI

struct ClimateControlView: View {
    
    var body: some View {
        backgroundStackView(color: climateBackgroundGradient) {
            ZStack {
                VStack {
                    Spacer()
                        .frame(height: 60)
                    NavigationBarView(headerText: "CLIMATE", isTapped: $shouldShowAlert)
                    Spacer()
                        .frame(height: 40)
                    indicatorView
                    Spacer()
                        .frame(height: 40)
                    slidersView
                    Spacer()
                }
                .blur(radius: shouldShowAlert ? 10 : 0)
                .frame(height: UIScreen.main.bounds.height)
                bottomSheetView
                    .frame(height: UIScreen.main.bounds.height + 250)
                    .background(RoundedRectangle(
                        cornerRadius: 40)
                        .fill(.lockButtonGradientBottom))
                    .ignoresSafeArea(.all, edges: .bottom)
                    .offset(y: UIScreen.main.bounds.height)
                    .offset(y: currentSettingsOffsetY)
                    .gesture(dragGesture)
                    .blur(radius: shouldShowAlert ? 10 : 0)
                if shouldShowAlert {
                    alertView
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        .zIndex(1)
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @Environment(\.dismiss) private var dismiss
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentSettingsOffsetY: CGFloat = 0.0
    @State private var lastSettingsOffsetY: CGFloat = 0.0
    @State private var acOffset = 0.0
    @State private var acTurnedOff = 0.0
    @State private var fanOffset = 0.0
    @State private var heatOffset = 0.0
    @State private var autoOffset = 0.0
    @State private var sliderValue = 15
    @State private var acValue: Double = 15.0
    @State private var fanValue: Double = 0.0
    @State private var heatValue: Double = 0.0
    @State private var autoValue: Double = 0.0
    @State private var isExpanded = true
    @State private var isACOn: Bool = false
    @State private var shouldShowAlert = false
    @State private var mainColor = Color.yellow
    
    private var bottomSheetView: some View {
        VStack {
            bottomSheetHeaderView
            controlButtonsView
            Spacer()
        }
    }
    
    private var indicatorView: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat((acValue - 15) / 15))
                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round))
                .foregroundColor(mainColor)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 192, height: 192)
                .zIndex(1)
                .opacity(isACOn ? 1 : 0)
                .shadow(color: mainColor, radius: 10, x: 0, y: 0)
            Circle()
                .fill(climateIndicatorGradient)
                .frame(width: 185, height: 185)
                .climateCircleIndicatorConfiguration()
            Circle()
                .fill(
                    .darkShadow
                        .shadow(.inner(color: .circleButtonGradientTop.opacity(0.6), radius: 50, x: -80, y: -80))
                    
                )
                .overlay {
                    Text("\(acValue.description.prefix(2))° C")
                        .font(.system(size: 30, weight: .bold))
                        .opacity(isACOn ? 1 : 0)
                        .animation(.default)
                }
                .frame(width: 130, height: 130)
                .background(Circle().stroke(.climateIndicatorMiddle, lineWidth: 1))
                .circleButtonConfiguration()
            
        }
    }
    
    private var slidersView: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            VStack(spacing: 20) {
                acSliderView
                fanSliderView
                heatSliderView
                autoSliderView
            }
            
        } label: {
        }
        .padding(.horizontal)
        
    }
    
    private var acSliderView: some View {
            HStack {
                Text("A/C")
                    .frame(width: 50)
                Spacer()
                    .frame(width: 20)
                Button {
                    
                } label: {
                    Image("acImage")
                        .renderingMode(.template)
                        .foregroundColor(isACOn ? mainColor : .textGray)
                }
                .climateCircleSettingConfiguration()

                Spacer()
                ClmateCustomSLider(
                    value: $acValue,
                    minValue: 15,
                    maxValue: 30,
                    offset: isACOn ? $acOffset : $acTurnedOff,
                    sliderProgressColor: $mainColor
                )
                    .frame(width: 190)
                Spacer()
                    .frame(width: 20)

                
        }
            .disabled(!isACOn)
            .padding(.top, 10)
            .foregroundColor(.gray)
    }
    
    private var fanSliderView: some View {
            HStack {
                Text("Fan")
                    .frame(width: 50)
                Spacer()
                    .frame(width: 20)
                Button {
                    
                } label: {
                    Image("fanImage")
                }
                .climateCircleSettingConfiguration()


                Spacer()
                ClmateCustomSLider(
                    value: $fanValue,
                    minValue: 15,
                    maxValue: 30,
                    offset: isACOn ? $fanOffset : $acTurnedOff,
                    sliderProgressColor: $mainColor
                )
                    .frame(width: 190)
                Spacer()
                    .frame(width: 20)
                    
        }
        .foregroundColor(.gray)
        .padding(.top, 10)
        .disabled(!isACOn)

    }
    
    private var heatSliderView: some View {
            HStack {
                Text("Heat")
                    .frame(width: 50)
                Spacer()
                    .frame(width: 20)
                Button {
                    
                } label: {
                    Image("heatImage")
                }
                .climateCircleSettingConfiguration()
                Spacer()
                ClmateCustomSLider(
                    value: $heatValue,
                    minValue: 15,
                    maxValue: 30,
                    offset: isACOn ? $heatOffset : $acTurnedOff,
                    sliderProgressColor: $mainColor
                )
                    .frame(width: 190)
                Spacer()
                    .frame(width: 20)
                    
        }
        .foregroundColor(.gray)
        .padding(.top, 10)
        .disabled(!isACOn)

    }
    
    private var autoSliderView: some View {
            HStack {
                Text("Auto")
                    .frame(width: 50)
                Spacer()
                    .frame(width: 20)
                Button {
                } label: {
                    Image("autoImage")
                }
                .climateCircleSettingConfiguration()

                Spacer()
                ClmateCustomSLider(
                    value: $autoValue,
                    minValue: 15,
                    maxValue: 30,
                    offset: isACOn ? $autoOffset : $acTurnedOff,
                    sliderProgressColor: $mainColor
                )
                    .frame(width: 190)
                Spacer()
                    .frame(width: 20)
                    
        }
        .foregroundColor(.gray)
        .padding(.vertical, 10)
        .disabled(!isACOn)

    }

    private var bottomSheetHeaderView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("A/C is \(isACOn ? "ON" : "OFF")")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("Tap to turn off or swipe up \nfor a fast setup")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button {
                    withAnimation {
                        isACOn.toggle()
                    }
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
                .shadow(color: .darkShadow, radius: 6, x: 0, y: 0)
            }
        }
        .padding(.top)
        .padding(.horizontal)
    }
    
    private var controlButtonsView: some View {
        HStack(alignment: .top,spacing: 50) {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 15)
                ColorPicker("", selection: $mainColor)
                    .frame(width: 20)
                Spacer()
                    .frame(height: 40)
                Text("On")
                    .font(.system(size: 20))
            }
            .frame(height: 90)
            HStack() {
                Button {
                    guard acValue > 15 else { return }
                    withAnimation {
                        acValue -= 1
                        acOffset -= 11
                    }
                } label: {
                    Image(.left)
                }
                .disabled(!isACOn)
                
                Text("\(Int(acValue))°")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                    .frame(width: 60)
                Button {
                    guard acValue < 30 else { return }
                    withAnimation {
                        acValue += 1
                        acOffset += 11
                    }
                } label: {
                    Image(.right)
                }
                .disabled(!isACOn)

            }
            VStack() {
                Spacer()
                    .frame(height: 15)
                Button {
                } label: {
                    Image(.vent)
                }
                Spacer()
                    .frame(height: 40)
                Text("Vent")
            }
            .frame(height: 80)
        }
        .frame(height: 100)
        .padding()
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                onChangeSettingsOffset()
            }
            .onEnded { value in
                let maxHeight = UIScreen.main.bounds.height / 5
                
                withAnimation {
                    if -currentSettingsOffsetY > maxHeight / 2 {
                        currentSettingsOffsetY = -maxHeight
                    } else {
                        currentSettingsOffsetY = 0
                    }
                    lastSettingsOffsetY = currentSettingsOffsetY
                }
            }
    }
    
    private var circleGradient: LinearGradient {
        LinearGradient(colors: [.lockedGradientMiddle.opacity(0.5), .circleButtonGradientTop.opacity(0.6)], startPoint: .topLeading
                       , endPoint: .bottomTrailing)
    }
    
    private var climateBackgroundGradient: LinearGradient {
        LinearGradient(colors: [.lockButtonGradientBottom, .unlockedGradientTop, .unlockedGradientBottom], startPoint: .top, endPoint: .bottom)
    }
    
    private var climateIndicatorGradient: LinearGradient {
        LinearGradient(colors: [ .climateIndicatorGradientLight, .climateIndicatorGradientDark.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var alertView: some View {
        VStack(spacing: 15) {
            Text("Tesla Support")
                .foregroundStyle(.white)
                .fontWeight(.bold)
            ControlGroup {
                if let url = URL(string: "https://www.tesla.com/support") {
                    Link(destination: url, label: {
                        Text("Open website")
                    })
                    .foregroundColor(.topGradient)
            }
                Button("Cancel") {
                    withAnimation {
                        shouldShowAlert.toggle()
                    }
                }
                .foregroundStyle(.textGray)
            }
            .frame(width: 200, height: 30)
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(.climateIndicatorGradientLight))
        .shadow(radius: 10)
    }
    
    private func onChangeSettingsOffset() {
        DispatchQueue.main.async {
            self.currentSettingsOffsetY = gestureOffset.height + lastSettingsOffsetY
        }
    }
    
}

#Preview {
    ClimateControlView()
        .environment(\.colorScheme, .dark)
}
