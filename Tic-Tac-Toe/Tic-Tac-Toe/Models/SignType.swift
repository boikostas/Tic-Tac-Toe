//
//  SignType.swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 27.07.2024.
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
