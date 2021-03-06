//
//  BishopAllowMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class BishopAllowMovesTests: XCTestCase {
    
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
    
    func testMoveWhiteBishopFromA1ToH8() {
        boardState = BoardHandler.putPiece(.whiteBishop, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testMoveWhiteBishopFromH1ToA8() {
        boardState = BoardHandler.putPiece(.whiteBishop, on: H1, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: H1, toSquare: A8), boardState: boardState))
    }
    
    func testMoveWhiteBishopFromD4ToE5ToF4() {
        boardState = BoardHandler.putPiece(.whiteBishop, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: D4, toSquare: E5), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: E5, toSquare: F4), boardState: boardState))
    }
    
    // Black
    
    func testMoveBlackBishopFromA1ToH8() {
        boardState = BoardHandler.putPiece(.blackBishop, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testMoveBlackBishopFromH1ToA8() {
        boardState = BoardHandler.putPiece(.blackBishop, on: H1, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: H1, toSquare: A8), boardState: boardState))
    }
    
    func testMoveBlackBishopFromD4ToE5ToF4() {
        boardState = BoardHandler.putPiece(.blackBishop, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: D4, toSquare: E5), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: E5, toSquare: F4), boardState: boardState))
    }
}
