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
            
            Text("Queens left: \(viewModel.size - viewModel.queens.count)")
            
            BoardView(
                size: viewModel.size,
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
    }
}

