//
//  PawnBoardOperationsTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class PawnBoardOperationsTests: XCTestCase {
    
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
    
    func testPutWhitePawnOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetWhitePawnOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
    
    // Black
    
    func testPutBlackPawnOnA7() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: A7, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: A7, boardState: boardState))
    }
    
    func testGetBlackPawnOnD4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: D4, boardState: boardState))
        XCTAssertNotNil(BoardHandler.getPiece(on: D4, boardState: boardState))
    }
}
