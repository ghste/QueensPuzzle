//
//  HomeView.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/25/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("N-Queens Puzzle")
            
            Text("Board size")
                .font(.headline)
            
            NavigationLink(
                destination: {
                    // TODO: Build Game View
                },
                label: {
                    Text("Start Game")
                }
            )
        }
    }
}
