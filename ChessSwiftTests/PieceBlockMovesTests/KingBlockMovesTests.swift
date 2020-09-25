//
//  KingBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KingBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteKingFromD4ToD5() {
        boardState = BoardHandler.putPiece(.whiteKing, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKing, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testBlockWhiteKingFromB4ToC4() {
        boardState = BoardHandler.putPiece(.whiteKing, on: B4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteKing, on: C4, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: B4, toSquare: C4), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackKingFromD4ToD5() {
        boardState = BoardHandler.putPiece(.blackKing, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackKing, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testBlockBlackKingFromB4ToC4() {
        boardState = BoardHandler.putPiece(.blackKing, on: B4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackKing, on: C4, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: B4, toSquare: C4), boardState: boardState))
    }
}
