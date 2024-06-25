//
//  SpinningView.swift
//  Atleta
//
//  Created by Michael Aronian Aronian on 6/25/24.
//

import SwiftUI

struct SpinningView: View {
    @State private var isAnimating: Bool = false

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.blue, lineWidth: 5)
            .frame(width: 50, height: 50)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
            .onAppear {
                self.isAnimating = true
            }
    }
}

#Preview {
    SpinningView()
}
