//
//  NQueensEngine.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

class NQueensEngine {
    let boardSize: Int
    private var conflicts: Set<Position> = []
    var queens: Set<Position> = []

    init(boardSize: Int) {
        self.boardSize = boardSize
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
    
    private func updateConflicts() {
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

    func updateQueenPosition(at pos: Position) {
        if queens.contains(pos) {
            // Remove queen
            queens.remove(pos)
        } else {
            // Add queen
            if queens.count < boardSize {
                queens.insert(pos)
            }
        }
        
        updateConflicts()
    }

    func isSolved() -> Bool {
        // Must place exactly N queens
        guard queens.count == boardSize else {
            return false
        }
        
        // No conflicts
        return conflicts.isEmpty
    }
    
    func hasQueen(at pos: Position) -> Bool {
         return queens.contains(pos)
    }
    
    func hasConflict(pos: Position) -> Bool {
        return conflicts.contains(pos)
    }
    
    func reset() {
        queens.removeAll()
        conflicts.removeAll()
    }
}
