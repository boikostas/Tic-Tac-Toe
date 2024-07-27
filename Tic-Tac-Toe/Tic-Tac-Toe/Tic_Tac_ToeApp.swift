//
//  Tic_Tac_ToeApp.swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 24.07.2024.
//

import SwiftUI

@main
struct Tic_Tac_ToeApp: App {
    
    @State private var path = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                FirstScreen(path: $path)
            }
        }
    }
}
