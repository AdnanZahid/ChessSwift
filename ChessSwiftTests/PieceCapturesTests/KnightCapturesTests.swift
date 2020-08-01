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
        boardState = BoardState()
        BoardHandler.setup(boardState: boardState, configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    // White
    
    func testCaptureWhiteKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: E6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, E6), boardState: boardState))
    }
    
    func testCaptureWhiteKnightFromD4ToC2ToE1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: C2, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: E1, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, C2), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(C2, E1), boardState: boardState))
    }
    
    // Black
    
    func testCaptureBlackKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: E6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, E6), boardState: boardState))
    }
    
    func testCaptureBlackKnightFromD4ToC2ToE1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: C2, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: E1, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, C2), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(C2, E1), boardState: boardState))
    }
}
