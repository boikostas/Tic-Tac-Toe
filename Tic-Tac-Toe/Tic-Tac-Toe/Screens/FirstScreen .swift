//
//  FirstScreen .swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 24.07.2024.
//

import SwiftUI

struct FirstScreen: View {
    var body: some View {
        ZStack {
            backgroundGradient
            titleWithBackground
            playButtonsGroup
        }
        .ignoresSafeArea()
        
    }
    
    private var backgroundGradient: some View {
        BackgroundGradient()
    }
    
    private var titleWithBackground: some View {
        VStack {
            ZStack {
                HStack(spacing: 0) {
                    Image(systemName: "xmark")
                        .opacity(0.1)
                        .font(.system(size: 450))
                        .fontWeight(.heavy)
                        .offset(x: 140, y: 0)
                    
                    Image(systemName: "circlebadge")
                        .opacity(0.1)
                        .font(.system(size: 500))
                        .fontWeight(.heavy)
                        .offset(x: -40, y: -100)
                    
                }
                .padding(.top, 30)
                
                Text("TIC-TAC-TOE")
                    .foregroundStyle(.white)
                    .font(.system(size: 50))
                    .fontWeight(.heavy)

            }
            .foregroundStyle(.black)
            
            Spacer()
        }
    }
    
    private var playButtonsGroup: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("Choose who you wanna play against")
                .fontWeight(.light)
                .font(.system(size: 18))
                .frame(alignment: .center)
                .foregroundStyle(.white)
            
            Image(systemName: "arrow.triangle.branch")
                .fontWeight(.light)
                .rotationEffect(.degrees(180))
                .foregroundStyle(.white)
                .font(.system(size: 18))
            
            HStack(spacing: 25) {
                PlayButton(gameType: .pvp, size: 150)
                PlayButton(gameType: .pve, size: 150)
            }
            .padding(.horizontal, 40)
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    FirstScreen()
}
