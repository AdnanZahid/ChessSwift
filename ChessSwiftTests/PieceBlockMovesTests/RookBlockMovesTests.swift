//
//  RookBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class RookBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteRookFromD4ToD5() {
        boardState = BoardHandler.putPiece(.whiteRook, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }

    func testBlockWhiteRookFromF6ToF1() {
        boardState = BoardHandler.putPiece(.whiteRook, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: F1, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F1), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackRookFromD4ToD5() {
        boardState = BoardHandler.putPiece(.blackRook, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testBlockBlackRookFromF6ToF1() {
        boardState = BoardHandler.putPiece(.blackRook, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: F1, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F1), boardState: boardState))
    }
}
