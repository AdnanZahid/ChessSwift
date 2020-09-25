//
//  PawnBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class PawnBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhitePawnFromA2ToA4() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whitePawn, on: A3, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: A2, toSquare: A4), boardState: boardState))
    }
    
    func testBlockWhitePawnFromE2ToE3() {
        boardState = BoardHandler.putPiece(.whitePawn, on: E2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whitePawn, on: E3, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: E2, toSquare: E3), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackPawnFromG7ToG5() {
        boardState = BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackPawn, on: G5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: G7, toSquare: G5), boardState: boardState))
    }
    
    func testBlockBlackPawnFromB6ToB5() {
        boardState = BoardHandler.putPiece(.blackPawn, on: B6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackPawn, on: B5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: B6, toSquare: B5), boardState: boardState))
    }
}
