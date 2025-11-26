//
//  HomeView.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/25/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedBoardSize: Int = 6

    // Minimum valid N-Queens size.
    // Boards smaller than 4×4 have no possible solutions.
    private let minBoardSize = 4
    
    // Upper bound chosen for practical usability.
    // Larger boards still work logically, but they reduce tap targets below Apple’s 44pt guideline
    // and make the UI difficult to interact with on iPhone screens.
    private let maxBoardSize = 9
    
    var body: some View {
        VStack(spacing: 32) {
            Text("N-Queens Puzzle")
                .font(.largeTitle.bold())
                .padding(.top, 30)
            
            VStack(spacing: 12) {
                Text("Board size")
                    .font(.headline)
                
                Picker("Board size", selection: $selectedBoardSize) {
                    ForEach(minBoardSize...maxBoardSize, id: \.self) { size in
                        Text("\(size) x \(size)").tag(size)
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 150)
            }
            
            NavigationLink(
                destination: {
                    let engine = NQueensEngine(boardSize: selectedBoardSize)
                    let viewModel = GameViewModel(gameEngine: engine)
                    GameView(viewModel: viewModel)
                },
                label: {
                    Text("Start Game")
                        .font(.title3.bold())
                        .padding(.vertical, 14)
                        .padding(.horizontal, 40)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            )
            .padding(.top, 12)
        }
    }
}
