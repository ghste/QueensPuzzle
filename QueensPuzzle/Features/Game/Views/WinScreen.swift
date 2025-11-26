//
//  WinScreen.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import SwiftUI

struct WinScreen: View {
    let dismiss: () -> Void
 
    var body: some View {
        ZStack {
            Color.white.opacity(0.8)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("🎉 You WON!!!")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text("Great job solving the puzzle!")
                    .font(.title3)
                    .foregroundColor(.white)
                
            }
            .padding(40)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 30)
        }
        .onTapGesture {
            dismiss()
        }
    }
}


#Preview {
    WinScreen(dismiss: {})
}
