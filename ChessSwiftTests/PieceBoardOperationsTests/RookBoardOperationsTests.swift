//
//  RookBoardOperationsTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class RookBoardOperationsTests: XCTestCase {
    
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
    
    func testPutWhiteRookOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetWhiteRookOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
    
    // Black
    
    func testPutBlackRookOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetBlackRookOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
}
