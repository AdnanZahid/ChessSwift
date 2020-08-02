//
//  KnightAllowMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KnightAllowMovesTests: XCTestCase {
    
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
    
    func testMoveWhiteKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E6), boardState: boardState))
    }
    
    func testMoveWhiteKnightFromD4ToC2ToE1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: C2), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: C2, toSquare: E1), boardState: boardState))
    }
    
    // Black
    
    func testMoveBlackKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E6), boardState: boardState))
    }
    
    func testMoveBlackKnightFromD4ToC2ToE1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: C2), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: C2, toSquare: E1), boardState: boardState))
    }
}
