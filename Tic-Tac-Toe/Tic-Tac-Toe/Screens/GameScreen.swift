//
//  GameScreen.swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 26.07.2024.
//

import SwiftUI

enum SignType {
    
    case none, x, o
    
    var signImage: Image {
        switch self {
        case .none:
            Image(systemName: "x.square")
        case .x:
            Image(systemName: "xmark")
        case .o:
            Image(systemName: "circlebadge")
        }
    }
}

struct GameScreen: View {
    
    private let fixedColumn = [
        GridItem(.fixed(100), spacing: 5),
           GridItem(.fixed(100), spacing: 5),
           GridItem(.fixed(100), spacing: 5)
       ]
    
    @State private var boardCells: [SignType] = [.none, .none, .none,
                                                 .none, .none, .none,
                                                 .none, .none, .none]
    
    private let boardCellTag = Array(0..<9)
    
    @State private var currentPlayerSing: SignType? = nil
    var gameType: GameType = .pve
    
    @State private var turnLabel = "Your turn"
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                
                Text(turnLabel)
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 32))
                    .padding(.bottom, 50)
                gameBoard
            }
            
        }
        .ignoresSafeArea()
        .onAppear {
            startGame()
        }
    }
    
    private var gameBoard: some View {
        ZStack {
            boardGrid
            
            LazyVGrid(columns: fixedColumn, spacing: 10) {
                ForEach(boardCellTag, id: \.self) { index in
                    ZStack {
                        Rectangle().opacity(0.0001)
                        boardCells[index].signImage
                            .opacity(boardCells[index] == .none ? 0 : 1)
                            .foregroundStyle(boardCells[index] == .x ? .signRed : .signGreen)
                            .fontWeight(.heavy)
                            .font(.system(size: boardCells[index] == .x ? 80 : 100))
                    }
                    .frame(width: 90, height: 90)
                    .onTapGesture {
                        if boardCells[index] == .none {
                            if let currentPlayerSing {
                                boardCells[index] = currentPlayerSing
                            }
                        }
                        nextTurn()
                    }
                }
            }
        }
    }
    
    private var boardGrid: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).fill(.white)
                .frame(width: 350,height: 350)
            
            HStack(spacing: 100) {
                Group {
                    Rectangle().fill(.gridLightGray)
                    Rectangle().fill(.gridLightGray)
                }
                .frame(width: 2, height: 300)
            }
            
            VStack(spacing: 100) {
                Group {
                    Rectangle().fill(.gridLightGray)
                    Rectangle().fill(.gridLightGray)
                }
                .frame(width: 300, height: 2)
            }
        }
    }
    
    private func startGame() {
        switch gameType {
        case .pvp:
            currentPlayerSing = .x
            turnLabel = "PLAYER 1's TURN"
        case .pve:
            currentPlayerSing = .x
            turnLabel = "YOUR TURN"
        }
    }
    
    private func nextTurn() {
        
        switch gameType {
        case .pvp:
            currentPlayerSing == .x ? (currentPlayerSing = .o) : (currentPlayerSing = .x)
            currentPlayerSing == .x ? (turnLabel = "PLAYER 1's TURN") : (turnLabel = "PLAYER 2's TURN")
        case .pve:
            currentPlayerSing == .x ? (currentPlayerSing = .o) : (currentPlayerSing = .x)
            currentPlayerSing == .x ? (turnLabel = "YOUR TURN") : (turnLabel = "🤖's TURN")
        }
    }
}

#Preview {
    GameScreen()
}
