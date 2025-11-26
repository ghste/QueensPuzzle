//
//  GameViewModel.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    
    @Published var queens: Set<Position> = []
    @Published var conflicts: Set<Position> = []
    @Published var hasWon: Bool = false
    
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
            if queens.count < size {
                queens.insert(pos)
            }
        }
        
        recalcConflicts()
        checkWinCondition()
    }
    
    func reset() {
        queens.removeAll()
        conflicts.removeAll()
        hasWon = false
    }
    
    // MARK: - View → Presentation State
    
    func cellState(at pos: Position) -> CellState {
        if queens.contains(pos) {
            return .queen(isConflict: conflicts.contains(pos))
        } else {
            return .empty
        }
    }
    
    // MARK: - Conflict Logic
    
    private func recalcConflicts() {
        var newConflicts: Set<Position> = []
        
        // Compare each pair of queens
        for q1 in queens {
            for q2 in queens where q1 != q2 {
                if areInConflict(q1, q2) {
                    newConflicts.insert(q1)
                    newConflicts.insert(q2)
                }
            }
        }
        
        conflicts = newConflicts
    }
    
    private func areInConflict(_ a: Position, _ b: Position) -> Bool {
        // same row
        if a.row == b.row { return true }
        
        // same column
        if a.col == b.col { return true }
        
        // diagonal
        if abs(a.row - b.row) == abs(a.col - b.col) { return true }
        
        return false
    }
    
    // MARK: - Win Condition
    
    private func checkWinCondition() {
        // Must place exactly N queens
        guard queens.count == size else {
            hasWon = false
            return
        }
        
        // No conflicts
        hasWon = conflicts.isEmpty
    }
}

