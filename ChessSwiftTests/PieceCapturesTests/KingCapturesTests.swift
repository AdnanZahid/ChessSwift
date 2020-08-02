//
//  KingCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KingCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhiteKingFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testCaptureWhiteKingFromB4ToC5ToC6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: B4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: C5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: C6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: B4, toSquare: C5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: C5, toSquare: C6), boardState: boardState))
    }
    
    // Black
    
    func testCaptureBlackKingFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testCaptureBlackKingFromB4ToC5ToC6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: B4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: C5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: C6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: B4, toSquare: C5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: C5, toSquare: C6), boardState: boardState))
    }
}
