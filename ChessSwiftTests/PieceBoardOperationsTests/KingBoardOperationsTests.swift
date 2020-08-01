//
//  KingBoardOperationsTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KingBoardOperationsTests: XCTestCase {
    
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
    
    func testPutWhiteKingOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetWhiteKingOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
    
    // Black
    
    func testPutBlackKingOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetBlackKingOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
}
