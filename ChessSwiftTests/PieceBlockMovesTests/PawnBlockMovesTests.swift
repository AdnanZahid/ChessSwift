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
        boardState = BoardState()
        BoardHandler.setup(boardState: boardState, configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    // White
    
    func testBlockWhitePawnFromA2ToA4() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A3, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(fromSquare: A2, toSquare: A4), boardState: boardState))
    }
    
    func testBlockWhitePawnFromE2ToE3() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: E2, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: E3, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(fromSquare: E2, toSquare: E3), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackPawnFromG7ToG5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G5, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(fromSquare: G7, toSquare: G5), boardState: boardState))
    }
    
    func testBlockBlackPawnFromB6ToB5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: B6, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: B5, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(fromSquare: B6, toSquare: B5), boardState: boardState))
    }
}
