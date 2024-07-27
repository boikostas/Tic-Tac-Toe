//
//  GameScreen.swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 26.07.2024.
//

import SwiftUI

enum SignType: Identifiable {
    var id: String {
        UUID().uuidString
    }
    
    case none, x, o
    
    var signImage: Image {
        switch self {
        case .none:
            Image(systemName: "house")
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
    
    @State private var data: [SignType] = Array(repeating: .none, count: 9)
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            
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
            
            LazyVGrid(columns: fixedColumn, spacing: 10) {
                ForEach(data) { item in
                    item.signImage
                        .frame(width: 90, height: 90)
                        .onTapGesture {
                            for item in data {
                                print(item.id)
                            }
//                            if item == .none {
//                                for index in 0..<data.count {
//                                    print("endex" + data[index].id)
//                                    if data[index].id == item.id {
//                                        data[index] = .x  
//                                    }
//                                }
//                            }
                        }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GameScreen()
}
