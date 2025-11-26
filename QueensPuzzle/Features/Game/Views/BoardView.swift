//
//  BoardView.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import SwiftUI

struct BoardView: View {
    let size: Int
    let cellState: (Position) -> CellState
    let onTap: (Position) -> Void
    
    var body: some View {
        let tile = min(UIScreen.main.bounds.width / CGFloat(size), 44)
        
        VStack(spacing: 0) {
            ForEach(0..<size, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<size, id: \.self) { col in
                        let pos = Position(row: row, col: col)
                        let cellState = cellState(pos)
                        
                        ZStack {
                            Rectangle()
                                .fill(((row + col) % 2 == 0)
                                      ? Color.white
                                      : Color.blue.opacity(0.25))
                            
                            switch cellState {
                            case .empty:
                                EmptyView()
                                
                            case .queen(let isConflict):
                                Text("♛")
                                    .font(.system(size: tile * 0.65))
                                    .foregroundColor(isConflict ? .red : .black)
                                    .animation(.easeInOut(duration: 0.2), value: isConflict)
                            }
                        }
                        .frame(width: tile, height: tile)
                        .border(Color.blue.opacity(0.25), width: 0.5)
                        .onTapGesture {
                            onTap(pos)
                        }
                    }
                }
            }
        }
    }
}

