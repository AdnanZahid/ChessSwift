//
//  KnightBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KnightBlockMovesTests: XCTestCase {
    
    private var boardState: BoardState!
    
    override func setUp() {
        super.setUp()
        boardState = BoardState()
        BoardHandler.setup(boardState: boardState, configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    // White
    
    func testBlockWhiteKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: E6, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, E6), boardState: boardState))
    }
    
    func testBlockWhiteKnightFromD4ToC2() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: C2, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, C2), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: E6, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, E6), boardState: boardState))
    }
    
    func testBlockBlackKnightFromD4ToC2() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: C2, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, C2), boardState: boardState))
    }
}
