//
//  GameViewModel.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var hasWon: Bool = false

    let gameEngine: NQueensEngineProtocol

    init(gameEngine: NQueensEngineProtocol) {
        self.gameEngine = gameEngine
    }
    
    func handleTap(_ pos: Position) {
        // on board tap update engine for the given position
        gameEngine.updateQueenPosition(at: pos)
        
        // check winning state
        hasWon = gameEngine.isSolved()
    }
    
    func reset() {
        gameEngine.reset()
        hasWon = false
    }
        
    func cellState(at pos: Position) -> CellState {
        if gameEngine.hasQueen(at: pos) {
            return .queen(isConflict: gameEngine.hasConflict(pos: pos))
        } else {
            return .empty
        }
    }
    
    func queensLeft() -> Int {
        return gameEngine.boardSize - gameEngine.queens.count
    }
    
    func boardSize() -> Int {
        gameEngine.boardSize
    }
}

