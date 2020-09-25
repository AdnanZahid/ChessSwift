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
        boardState = BoardHandler.setup(configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    // White
    
    func testBlockWhiteKnightFromD4ToE6() {
        boardState = BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKnight, on: E6, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E6), boardState: boardState))
    }
    
    func testBlockWhiteKnightFromD4ToC2() {
        boardState = BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKnight, on: C2, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: C2), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackKnightFromD4ToE6() {
        boardState = BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackKnight, on: E6, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E6), boardState: boardState))
    }
    
    func testBlockBlackKnightFromD4ToC2() {
        boardState = BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackKnight, on: C2, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: C2), boardState: boardState))
    }
}
