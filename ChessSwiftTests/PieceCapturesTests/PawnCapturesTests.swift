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
        boardState = BoardState()
        BoardHandler.setup(boardState: boardState, configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    // White
    
    func testCaptureWhitePawnFromA2ToB3() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: B3, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: A2, toSquare: B3), boardState: boardState))
    }
    
    func testCaptureWhitePawnFromA2ToA4ToA5() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: B3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: C4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: A2, toSquare: B3), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: B3, toSquare: C4), boardState: boardState))
    }
    
    // Black
    
    func testCaptureBlackPawnFromG7ToF6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: G7, toSquare: F6), boardState: boardState))
    }
    
    func testCaptureBlackPawnFromG7ToF6ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: E5, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: G7, toSquare: F6), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: E5), boardState: boardState))
    }
}
