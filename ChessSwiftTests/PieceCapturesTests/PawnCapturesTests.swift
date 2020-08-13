//
//  PawnCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class PawnCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhitePawnFromA2ToB3() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackPawn, on: B3, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: A2, toSquare: B3), boardState: boardState))
    }
    
    func testCaptureWhitePawnFromA2ToA4ToA5() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackPawn, on: B3, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackPawn, on: C4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: A2, toSquare: B3), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: B3, toSquare: C4), boardState: boardState))
    }
    
    // Black
    
    func testCaptureBlackPawnFromG7ToF6() {
        boardState = BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whitePawn, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: G7, toSquare: F6), boardState: boardState))
    }
    
    func testCaptureBlackPawnFromG7ToF6ToE5() {
        boardState = BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whitePawn, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whitePawn, on: E5, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: G7, toSquare: F6), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: F6, toSquare: E5), boardState: boardState))
    }
}
