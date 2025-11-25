//
//  HomeView.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/25/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedBoardSize: Int = 6

    private let minBoardSize = 4
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
                    GameView(viewModel: GameViewModel(size: selectedBoardSize))
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
