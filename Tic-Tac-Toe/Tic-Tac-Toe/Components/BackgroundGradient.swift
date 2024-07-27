//
//  BackgroundGradient.swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 26.07.2024.
//

import SwiftUI

struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(colors: [Color.gradientLight, Color.gradientDark], startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    BackgroundGradient()
}
