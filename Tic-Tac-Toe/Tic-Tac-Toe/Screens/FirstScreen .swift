//
//  FirstScreen .swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 24.07.2024.
//

import SwiftUI

struct FirstScreen: View {
    
    private var gameTypes: [GameType] = [.pvp, .pve]
    
    @Binding var path: NavigationPath
    
    init(path: Binding<NavigationPath>) {
        _path = path
    }
    
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
                ForEach(gameTypes, id: \.self) { type in
                    NavigationLink(value: type) {
                        PlayButton(gameType: type, size: 150)
                    }
                }
            }
            .padding(.horizontal, 40)
            .navigationDestination(for: GameType.self) { type in
                GameScreen(path: $path, gameType: type)
            }
        }
        .padding(.bottom, 40)
    }
}

struct FirstScreenPreview: View {
    
    @State var path = NavigationPath()
    
    var body: some View {
        FirstScreen(path: $path)
    }
}

#Preview {
    NavigationStack {
        FirstScreenPreview()
    }
}
