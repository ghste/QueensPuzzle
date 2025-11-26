//
//  NQueensEngine.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//
//  Responsible for all N-Queens domain logic:
//  - tracking queen positions
//  - determining conflicts
//  - evaluating win state
//  This class is pure logic and UI-agnostic.
//

protocol NQueensEngineProtocol {
    var boardSize: Int { get }
    var queens: Set<Position> { get }
    
    func updateQueenPosition(at pos: Position)
    func isSolved() -> Bool
    func hasQueen(at pos: Position) -> Bool
    func hasConflict(pos: Position) -> Bool
    func reset()
}

class NQueensEngine: NQueensEngineProtocol {
    let boardSize: Int
    private var conflicts: Set<Position> = []
    private(set) var queens: Set<Position> = []

    init(boardSize: Int) {
        self.boardSize = boardSize
    }

    private func areInConflict(_ a: Position, _ b: Position) -> Bool {
        // Queens attack horizontally, vertically, or diagonally.
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
        // prevent out-of-bounds positions
        guard pos.row >= 0,
              pos.col >= 0,
              max(pos.row, pos.col) < boardSize else {
            return
        }

        if queens.contains(pos) {
            queens.remove(pos)
        } else if queens.count < boardSize {
            queens.insert(pos)
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
