//
//  KingAllowMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KingAllowMovesTests: XCTestCase {
    
    private var boardState: BoardState!
    
    override func setUp() {
        super.setUp()
        boardState = BoardHandler.setup(configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    func testMoveWhiteKingFromD4ToD5() {
        boardState = BoardHandler.putPiece(.whiteKing, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testMoveWhiteKingFromB4ToC5ToC6() {
        boardState = BoardHandler.putPiece(.whiteKing, on: B4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: B4, toSquare: C5), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: C5, toSquare: C6), boardState: boardState))
    }
    
    func testMoveBlackKingFromD4ToD5() {
        boardState = BoardHandler.putPiece(.blackKing, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testMoveBlackKingFromB4ToC5ToD4() {
        boardState = BoardHandler.putPiece(.blackKing, on: B4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: B4, toSquare: C5), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: C5, toSquare: D4), boardState: boardState))
    }
}
