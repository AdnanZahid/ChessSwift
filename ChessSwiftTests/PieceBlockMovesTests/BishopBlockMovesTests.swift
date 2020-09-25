//
//  BishopBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class BishopBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteBishopFromA1ToH8() {
        boardState = BoardHandler.putPiece(.whiteKing, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKing, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testBlockWhiteBishopFromD1ToH5() {
        boardState = BoardHandler.putPiece(.whiteKing, on: D1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKing, on: F3, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D1, toSquare: H5), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackBishopFromA1ToH8() {
        boardState = BoardHandler.putPiece(.blackBishop, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testBlockBlackBishopFromD1ToH5() {
        boardState = BoardHandler.putPiece(.blackBishop, on: D1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: F3, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D1, toSquare: H5), boardState: boardState))
    }
}
