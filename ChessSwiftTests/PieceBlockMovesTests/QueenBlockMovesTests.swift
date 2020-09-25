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
        boardState = BoardHandler.setup(configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    // White
    
    func testBlockWhiteQueenFromD4ToD5() {
        boardState = BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteQueen, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testBlockWhiteQueenFromD4ToF6() {
        boardState = BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteQueen, on: E5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: F6), boardState: boardState))
    }
    
    func testBlockWhiteQueenFromA1ToH8() {
        boardState = BoardHandler.putPiece(.whiteQueen, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testBlockWhiteQueenFromH1ToA8() {
        boardState = BoardHandler.putPiece(.whiteQueen, on: H1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteQueen, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: H1, toSquare: A8), boardState: boardState))
    }
    
    func testBlockWhiteQueenFromF6ToF1() {
        boardState = BoardHandler.putPiece(.whiteQueen, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteQueen, on: F3, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F1), boardState: boardState))
    }
    
    // Black
    
    func testBlockBlackQueenFromD4ToD5() {
        boardState = BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackQueen, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testBlockBlackQueenFromD4ToF6() {
        boardState = BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackQueen, on: E5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: F6), boardState: boardState))
    }
    
    func testBlockBlackQueenFromA1ToH8() {
        boardState = BoardHandler.putPiece(.blackQueen, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testBlockBlackQueenFromH1ToA8() {
        boardState = BoardHandler.putPiece(.blackQueen, on: H1, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackQueen, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: H1, toSquare: A8), boardState: boardState))
    }
    
    func testBlockBlackQueenFromF6ToF1() {
        boardState = BoardHandler.putPiece(.blackQueen, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackQueen, on: F3, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNil(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F1), boardState: boardState))
    }
}
