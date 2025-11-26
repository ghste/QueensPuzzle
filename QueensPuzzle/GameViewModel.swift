//
//  GameViewModel.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    
    @Published var queens: Set<Position> = []

    let size: Int
    
    init(size: Int) {
        self.size = size
    }
    
    func handleTap(_ pos: Position) {
        if queens.contains(pos) {
            // Remove queen
            queens.remove(pos)
        } else {
            // Add queen
            queens.insert(pos)
        }
    }
    
    func reset() {
        queens.removeAll()
    }
    
    // MARK: - View → Presentation State
    
    func cellState(at pos: Position) -> CellState {
        if queens.contains(pos) {
            return .queen(isConflict: false)
        } else {
            return .empty
        }
    }
 
}

