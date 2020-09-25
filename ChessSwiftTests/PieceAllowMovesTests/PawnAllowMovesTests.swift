//
//  PawnAllowMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class PawnAllowMovesTests: XCTestCase {
    
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
    
    func testMoveWhitePawnFromA2ToA3() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: A2, toSquare: A3), boardState: boardState))
    }
    
    func testMoveWhitePawnFromA2ToA4() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: A2, toSquare: A4), boardState: boardState))
    }
    
    func testMoveWhitePawnFromA2ToA4ToA5() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: A2, toSquare: A4), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: A4, toSquare: A5), boardState: boardState))
    }
    
    // Invalid pawn moves
    
    func testInvalidMoveWhitePawnFromA2ToB2() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: A2, toSquare: B2), boardState: boardState))
    }
    
    func testInvalidMoveWhitePawnFromA2ToA1() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: A2, toSquare: A1), boardState: boardState))
    }
    
    // Black
    
    func testMoveBlackPawnFromG7ToG6() {
        boardState = BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: G7, toSquare: G6), boardState: boardState))
    }
    
    func testMoveBlackPawnFromG7ToG5() {
        boardState = BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: G7, toSquare: G5), boardState: boardState))
    }
    
    func testMoveBlackPawnFromG7ToG5ToG4() {
        boardState = BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: G7, toSquare: G5), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: G5, toSquare: G4), boardState: boardState))
    }
    
    // Invalid pawn moves
    
    func testInvalidMoveBlackPawnFromG7ToF7() {
        boardState = BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: G7, toSquare: F7), boardState: boardState))
    }
    
    func testInvalidMoveBlackPawnFromG7ToG8() {
        boardState = BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: G7, toSquare: G8), boardState: boardState))
    }
}
