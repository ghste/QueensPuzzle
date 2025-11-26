//
//  Untitled.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import XCTest
@testable import QueensPuzzle

final class GameViewModelTests: XCTestCase {
      
    // MARK: - Tests
    
    func testHandleTapCallsUpdateOnEngine() {
        let fake = FakeEngine(boardSize: 4)
        let vm = GameViewModel(gameEngine: fake)
        
        vm.handleTap(Position(row: 0, col: 0))
        
        XCTAssertTrue(fake.updateCalled)
    }
    
    func testHandleTapUpdatesHasWonFromEngine() {
        let fake = FakeEngine(boardSize: 4)
        fake.forcedSolved = true
        let vm = GameViewModel(gameEngine: fake)
        
        vm.handleTap(Position(row: 1, col: 1))
        
        XCTAssertTrue(vm.hasWon)
    }
    
    func testResetCallsEngineResetAndClearsWinState() {
        let fake = FakeEngine(boardSize: 4)
        fake.forcedSolved = true
        let vm = GameViewModel(gameEngine: fake)
        
        vm.hasWon = true
        vm.reset()
        
        XCTAssertTrue(fake.resetCalled)
        XCTAssertFalse(vm.hasWon)
    }
    
    func testCellStateEmptyWhenNoQueen() {
        let fake = FakeEngine(boardSize: 4)
        fake.forcedHasQueen = { _ in false }
        let vm = GameViewModel(gameEngine: fake)
        
        let state = vm.cellState(at: Position(row: 0, col: 0))
        
        switch state {
        case .empty:
            XCTAssertTrue(true)
        default:
            XCTFail("Expected empty cell")
        }
    }
    
    func test_cellState_queenNoConflict() {
        let fake = FakeEngine(boardSize: 4)
        fake.forcedHasQueen = { _ in true }
        fake.forcedHasConflict = { _ in false }
        let vm = GameViewModel(gameEngine: fake)
        
        let state = vm.cellState(at: Position(row: 0, col: 0))
        
        switch state {
        case .queen(let isConflict):
            XCTAssertFalse(isConflict)
        default:
            XCTFail("Expected queen state")
        }
    }
    
    func testCellStateQwueenWithConflict() {
        let fake = FakeEngine(boardSize: 4)
        fake.forcedHasQueen = { _ in true }
        fake.forcedHasConflict = { _ in true }
        let vm = GameViewModel(gameEngine: fake)
        
        let state = vm.cellState(at: Position(row: 0, col: 0))
        
        switch state {
        case .queen(let isConflict):
            XCTAssertTrue(isConflict)
        default:
            XCTFail("Expected queen state with conflict = true")
        }
    }
    
    func testQueensLeftReturnsCorrectCount() {
        let engine = FakeEngine(boardSize: 4)
        let vm = GameViewModel(gameEngine: engine)
        
        XCTAssertEqual(vm.boardSize(), 4)
        XCTAssertEqual(vm.queensLeft(), 4)
    }
    
    // MARK: - Mock Engine for testing
    
    final class FakeEngine: NQueensEngineProtocol {
        var boardSize: Int
        
        var queens: Set<QueensPuzzle.Position> = []
        
        var forcedSolved = false
        var forcedHasQueen: (Position) -> Bool = { _ in false }
        var forcedHasConflict: (Position) -> Bool = { _ in false }
        
        var updateCalled = false
        var resetCalled = false
        
        init(boardSize: Int) {
            self.boardSize = boardSize
        }
        
        func updateQueenPosition(at pos: Position) {
            updateCalled = true
        }
        
        func isSolved() -> Bool {
            forcedSolved
        }
        
        func hasQueen(at pos: Position) -> Bool {
            forcedHasQueen(pos)
        }
        
        func hasConflict(pos: Position) -> Bool {
            forcedHasConflict(pos)
        }
        
        func reset() {
            resetCalled = true
        }
    }
}
