//
//  PlayButton.swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 26.07.2024.
//

import SwiftUI

struct PlayButton: View {
    
    var gameType: GameType
    var size: CGFloat
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25.0).fill(.white)
            
            HStack(spacing: 5) {
                Text("VS.")
                    .fontWeight(.thin)
                    .font(.system(size: 16))
                    .offset(y: 10)
                Text(gameType.emoji)
                    .font(.system(size: 50))
            }
        }
        .foregroundStyle(.black)
        .frame(width: size, height: size)

    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [Color.gradientLight, Color.gradientDark], startPoint: .top, endPoint: .bottom)
        PlayButton(gameType: .pve, size: 120)
    }
    .ignoresSafeArea()
}
