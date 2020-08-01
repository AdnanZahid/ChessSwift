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
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: D5, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, D5), boardState: boardState))
    }
    
    func testCaptureWhiteKingFromB4ToC5ToC6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: B4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: C5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: C6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(B4, C5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(C5, C6), boardState: boardState))
    }
    
    // Black
    
    func testCaptureBlackKingFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D5, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, D5), boardState: boardState))
    }
    
    func testCaptureBlackKingFromB4ToC5ToC6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: B4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: C5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: C6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(B4, C5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(C5, C6), boardState: boardState))
    }
}
