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
    
    @State private var boardCells: [[SignType]] = [[.none, .none, .none],
                                                   [.none, .none, .none],
                                                   [.none, .none, .none]]
    
    @State private var currentPlayerSing: SignType? = nil
    var gameType: GameType = .pve
    
    @State private var turnLabel = "Your turn"
    @State private var enableToTap: Bool = true
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
            VStack {
                titleLabel
                gameBoard
            }
        }
        .ignoresSafeArea()
        .onAppear {
            startGame()
        }
    }
    
    private var titleLabel: some View {
        Text(turnLabel)
            .foregroundStyle(.white)
            .fontWeight(.heavy)
            .font(.system(size: 32))
            .padding(.bottom, 50)
    }
    
    private var gameBoard: some View {
        ZStack {
            boardGrid
            
            LazyVGrid(columns: fixedColumn, spacing: 10) {
                ForEach(0..<9) { index in
                    let i = index / 3, j = index % 3
                    ZStack {
                        Rectangle().opacity(0.0001)
                        boardCells[i][j].signImage
                            .opacity(boardCells[i][j] == .none ? 0 : 1)
                            .foregroundStyle(boardCells[i][j] == .x ? .signRed : .signGreen)
                            .fontWeight(.heavy)
                            .font(.system(size: boardCells[i][j] == .x ? 80 : 100))
                    }
                    .frame(width: 90, height: 90)
                    .onTapGesture {
                        if boardCells[i][j] == .none {
                            if let currentPlayerSing {
                                boardCells[i][j] = currentPlayerSing
                            }
                        }
                        nextTurn()
                    }
                    .disabled(!enableToTap)
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
            if checkIfGameOver() {
                return
            }
            currentPlayerSing == .x ? (currentPlayerSing = .o) : (currentPlayerSing = .x)
            currentPlayerSing == .x ? (turnLabel = "PLAYER 1's TURN") : (turnLabel = "PLAYER 2's TURN")
        case .pve:
            if checkIfGameOver() {
                return
            }
            currentPlayerSing == .x ? (currentPlayerSing = .o) : (currentPlayerSing = .x)
            currentPlayerSing == .x ? (turnLabel = "YOUR TURN") : (turnLabel = "🤖's TURN")
            enableToTap = (currentPlayerSing == .x) ? true : false
            
            if currentPlayerSing == .o {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.computerTurn()
                }
            }
        }
    }
    
    private func checkIfGameOver() -> Bool {
        if checkIfDraw() {
            return true
        }
        
        if let sign = currentPlayerSing {
            if isWin(with: sign) {
                switch gameType {
                case .pvp:
                    turnLabel = (sign == .x) ? "Player 1 wins!" : "Player 2 wins!"
                case .pve:
                    turnLabel = (sign == .x) ? "You win!" : "🤖 wins!"
                }
                enableToTap = false
                return true
            }
        }
        
        enableToTap = true
        return false
    }
    
    private func checkIfDraw() -> Bool {
        if boardCells.contains(where: { $0.contains(where: { $0 == .none }) }) {
            return false
        }
        
        turnLabel = "Draw!"
        enableToTap = false
        return true
    }
    
    private func computerTurn() {
        //TODO: Make it clever!
        outerLoop: for i in 0..<boardCells.count {
            for j in 0..<boardCells[i].count {
                if boardCells[i][j] == .none {
                    if let sign = currentPlayerSing {
                        boardCells[i][j] = sign
                        break outerLoop
                    }
                }
            }
        }
        nextTurn()
    }
    
    private func isWin(with sign: SignType) -> Bool {
        var leftDiagonalCount = 0, rightDiagonalCount = 0
        for i in 0..<boardCells.count {
            for j in 0..<boardCells[i].count {
                if i == j && boardCells[i][j] == sign {
                    leftDiagonalCount += 1
                }
                if i == boardCells.count - 1 - j && boardCells[i][j] == sign {
                    rightDiagonalCount += 1
                }
            }
        }
        if leftDiagonalCount == 3 || rightDiagonalCount == 3 {
            return true
        }
        
        for i in 0..<boardCells.count {
            var hCount = 0, vCount = 0
            for j in 0..<boardCells[i].count {
                if boardCells[i][j] == sign {
                    hCount += 1
                }
                if boardCells[j][i] == sign {
                    vCount += 1
                }
            }
            if vCount == 3 || hCount == 3 {
                return true
            }
        }
        
        return false
    }
}

#Preview {
    GameScreen()
}
