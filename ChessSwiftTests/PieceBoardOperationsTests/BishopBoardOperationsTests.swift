//
//  BishopBoardOperationsTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class BishopBoardOperationsTests: XCTestCase {
    
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
    
    func testPutWhiteBishopOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetWhiteBishopOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
    
    // Black
    
    func testPutBlackBishopOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetBlackBishopOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
}
