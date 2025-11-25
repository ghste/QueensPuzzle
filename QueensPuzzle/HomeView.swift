//
//  HomeView.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/25/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedBoardSize: Int = 6
    
    var body: some View {
        VStack(spacing: 32) {
            Text("N-Queens Puzzle")
                .font(.largeTitle.bold())
                .padding(.top, 30)
            
            VStack(spacing: 12) {
                Text("Board size")
                    .font(.headline)
                
                Picker("Board size", selection: $selectedBoardSize) {
                    ForEach(4...50, id: \.self) { size in
                        Text("\(size) x \(size)").tag(size)
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 150)
            }
            
            NavigationLink(
                destination: {
                    // TODO: Build Game View
                },
                label: {
                    Text("Start Game")
                }
            )
            .padding(.top, 12)
        }
    }
}
