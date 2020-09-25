//
//  KnightCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KnightCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhiteKnightFromD4ToE6() {
        boardState = BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackKnight, on: E6, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E6), boardState: boardState))
    }
    
    func testCaptureWhiteKnightFromD4ToC2ToE1() {
        boardState = BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackKnight, on: C2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackKnight, on: E1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: D4, toSquare: C2), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: C2, toSquare: E1), boardState: boardState))
    }
    
    // Black
    
    func testCaptureBlackKnightFromD4ToE6() {
        boardState = BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKnight, on: E6, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E6), boardState: boardState))
    }
    
    func testCaptureBlackKnightFromD4ToC2ToE1() {
        boardState = BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKnight, on: C2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKnight, on: E1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: D4, toSquare: C2), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: C2, toSquare: E1), boardState: boardState))
    }
}
