//
//  FirstScreen .swift
//  Tic-Tac-Toe
//
//  Created by Stas Boiko on 24.07.2024.
//

import SwiftUI

struct FirstScreen_: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.gradientLight, Color.gradientDark], startPoint: .top, endPoint: .bottom)
            
            titleWithBackground
        }
        .ignoresSafeArea()
        
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
            
            Spacer()
        }
    }
}

#Preview {
    FirstScreen_()
}
