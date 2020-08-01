//
//  QueenBoardOperationsTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class QueenBoardOperationsTests: XCTestCase {
    
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
    
    func testPutWhiteQueenOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetWhiteQueenOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
    
    // Black
    
    func testPutBlackQueenOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetBlackQueenOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
}
