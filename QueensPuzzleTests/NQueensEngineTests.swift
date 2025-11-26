//
//  NQueensEngineTests.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import XCTest
@testable import QueensPuzzle

final class NQueensEngineTests: XCTestCase {

    func testAddQueenWithinBounds() {
        let engine = NQueensEngine(boardSize: 4)
        let pos = Position(row: 1, col: 3)
        
        engine.updateQueenPosition(at: pos)
        
        XCTAssertTrue(engine.hasQueen(at: pos))
    }
    
    func testRemoveQueen() {
        let engine = NQueensEngine(boardSize: 4)
        let pos = Position(row: 1, col: 3)
        
        engine.updateQueenPosition(at: pos)
        XCTAssertTrue(engine.hasQueen(at: pos))

        engine.updateQueenPosition(at: pos)
        XCTAssertFalse(engine.hasQueen(at: pos))
    }
    
    func testAddQueenOutOfBounds() {
        let engine = NQueensEngine(boardSize: 4)
        let pos = Position(row: 1, col: 5)
        
        engine.updateQueenPosition(at: pos)
        
        XCTAssertFalse(engine.hasQueen(at: pos))
    }
    
    func testIsSolvedSuccessfully() {
        let engine = NQueensEngine(boardSize: 4)
        engine.updateQueenPosition(at: Position(row: 1, col: 0))
        engine.updateQueenPosition(at: Position(row: 0, col: 2))
        engine.updateQueenPosition(at: Position(row: 3, col: 1))
        engine.updateQueenPosition(at: Position(row: 2, col: 3))

        XCTAssertTrue(engine.isSolved())
    }
    
    func testIsSolvedFailure() {
        let engine = NQueensEngine(boardSize: 4)
        engine.updateQueenPosition(at: Position(row: 1, col: 0))
        engine.updateQueenPosition(at: Position(row: 0, col: 2))
        engine.updateQueenPosition(at: Position(row: 3, col: 1))
        
        XCTAssertFalse(engine.isSolved())
    }
    
    func testHasRowConflict() {
        let engine = NQueensEngine(boardSize: 4)
        let pos = Position(row: 1, col: 0)
        engine.updateQueenPosition(at: pos)
        engine.updateQueenPosition(at: Position(row: 1, col: 2))
        
        XCTAssertTrue(engine.hasConflict(pos: pos))
    }
    
    func testHasColumnConflict() {
        let engine = NQueensEngine(boardSize: 4)
        let pos = Position(row: 0, col: 0)
        engine.updateQueenPosition(at: pos)
        engine.updateQueenPosition(at: Position(row: 1, col: 0))
        
        XCTAssertTrue(engine.hasConflict(pos: pos))
    }
    
    func testHasDiagonalConflict() {
        let engine = NQueensEngine(boardSize: 4)
        let pos = Position(row: 0, col: 0)
        engine.updateQueenPosition(at: pos)
        engine.updateQueenPosition(at: Position(row: 1, col: 1))
        
        XCTAssertTrue(engine.hasConflict(pos: pos))
    }
    
    func testReset() {
        let engine = NQueensEngine(boardSize: 4)
        
        let pos = Position(row: 1, col: 0)
        engine.updateQueenPosition(at: pos)
        XCTAssertTrue(engine.hasQueen(at: pos))

        let pos1 = Position(row: 1, col: 1)
        engine.updateQueenPosition(at: pos1)
        XCTAssertTrue(engine.hasConflict(pos: pos1))

        engine.reset()
        
        XCTAssertFalse(engine.hasQueen(at: pos))
        XCTAssertFalse(engine.hasConflict(pos: pos1))
    }
}
