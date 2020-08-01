//
//  QueenBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class QueenBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteQueenFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, D5), boardState: boardState))
    }
    
    func testBlockWhiteQueenFromD4ToF6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E5, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, F6), boardState: boardState))
    }
    
    func testBlockWhiteQueenFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: A1, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(A1, H8), boardState: boardState))
    }
    
    func testBlockWhiteQueenFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: H1, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(H1, A8), boardState: boardState))
    }
    
    func testBlockWhiteQueenFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F3, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(F6, F1), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackQueenFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, D5), boardState: boardState))
    }
    
    func testBlockBlackQueenFromD4ToF6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E5, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, F6), boardState: boardState))
    }
    
    func testBlockBlackQueenFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: A1, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(A1, H8), boardState: boardState))
    }
    
    func testBlockBlackQueenFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: H1, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(H1, A8), boardState: boardState))
    }
    
    func testBlockBlackQueenFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F3, boardState: boardState))
        XCTAssertFalse(BoardHandler.move(MoveState(F6, F1), boardState: boardState))
    }
}
