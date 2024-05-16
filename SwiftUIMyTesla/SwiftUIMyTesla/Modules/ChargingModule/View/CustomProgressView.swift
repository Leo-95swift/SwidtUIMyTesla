import SwiftUI

struct CustomProgressView: View {
    @Binding var progress: Double

    var body: some View {
        ZStack(alignment: .leading) {
            CustomChargerShape()
                .stroke(Color.textGray, lineWidth: 1)
                .fill(.linearGradient(
                    colors: [
                        .chargerBackgroundTop,
                        .chargerBackgroundBottom.opacity(0.8),
                        .chargerBackgroundBottom.opacity(0.8),
                        .chargerBackgroundBottom.opacity(0.8)
                    ],
                    startPoint: .top,
                    endPoint: .bottom))
                .frame(width: 274, height: 39)

            CustomProgressShape(progress: progress)
                .fill(.linearGradient(
                    colors: [
                        .chargeGradientStart,
                        .chargeGradientEnd
                    ],
                    startPoint: .top,
                    endPoint: .bottom))
                .frame(width: CGFloat(progress) * 3, height: 40)
                .shadow(
                    color: .chargeGradientEnd,
                    radius: 40, x: 0, y: -70)
                .animation(.linear, value: progress)

            HStack {
                Text("\(Int(progress))")
                    .foregroundColor(.white)
                    .font(.system(size: 35))
                    .bold()
                
                Text("%")
                    .foregroundColor(.textGray)
                    .font(.system(size: 20))
            }
            .offset(x: 137, y: -50)
        }
    }
}

