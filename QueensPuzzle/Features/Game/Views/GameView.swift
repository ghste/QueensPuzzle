//
//  GameView.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            Text("Queens left: \(viewModel.queensLeft())")
            
            BoardView(
                size: viewModel.boardSize(),
                cellState: { pos in
                    viewModel.cellState(at: pos)
                },
                onTap: { pos in
                    viewModel.handleTap(pos)
                }
            )
            
            Button("Reset") {
                viewModel.reset()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Board")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    viewModel.reset()
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
        .overlay {
            if viewModel.hasWon {
                WinScreen {
                    viewModel.reset()
                    dismiss()
                }
                .transition(.opacity.animation(.easeInOut(duration: 0.6)))
            }
        }
    }
}

#Preview {
    let engine = NQueensEngine(boardSize: 4)
    let viewModel = GameViewModel(gameEngine: engine)
    GameView(viewModel: viewModel)
}

