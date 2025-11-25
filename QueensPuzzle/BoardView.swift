//
//  BoardView.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import SwiftUI

struct BoardView: View {
    let size: Int 
    
    var body: some View {
        let tile = min(UIScreen.main.bounds.width / CGFloat(size), 44)
        
        VStack(spacing: 0) {
            ForEach(0..<size, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<size, id: \.self) { col in
                        ZStack {
                            Rectangle()
                                .fill(((row + col) % 2 == 0)
                                      ? Color.white
                                      : Color.blue.opacity(0.25))
                            
                            EmptyView()
                        }
                        .frame(width: tile, height: tile)
                    }
                }
            }
        }
    }
}

