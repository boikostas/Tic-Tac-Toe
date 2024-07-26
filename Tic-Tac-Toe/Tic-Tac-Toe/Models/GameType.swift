//
//  GameType.swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 26.07.2024.
//

import Foundation

enum GameType {
    case pvp, pve
    
    var emoji: String {
        switch self {
        case .pvp:
            "👨‍🦰"
        case .pve:
            "🤖"
        }
    }
}
