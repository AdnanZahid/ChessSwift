//
//  QueenAllowMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class QueenAllowMovesTests: XCTestCase {
    
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
    
    func testMoveWhiteQueenFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testMoveWhiteQueenFromD4ToE5ToF4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: E5, toSquare: F4), boardState: boardState))
    }
    
    func testMoveWhiteQueenFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D5, toSquare: E5), boardState: boardState))
    }
    
    func testMoveWhiteQueenFromF6ToG5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: G5), boardState: boardState))
    }
    
    func testMoveWhiteQueenFromF6ToG5ToH4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: G5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: G5, toSquare: H4), boardState: boardState))
    }
    
    func testMoveWhiteQueenFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: A1, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testMoveWhiteQueenFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: H1, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: H1, toSquare: A8), boardState: boardState))
    }
    
    func testMoveWhiteQueenFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F1), boardState: boardState))
    }
    
    func testMoveWhiteQueenFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F2), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F2, toSquare: A2), boardState: boardState))
    }
    
    // Black
    
    func testMoveBlackQueenFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testMoveBlackQueenFromD4ToE5ToF4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: E5, toSquare: F4), boardState: boardState))
    }
    
    func testMoveBlackQueenFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D5, toSquare: E5), boardState: boardState))
    }
    
    func testMoveBlackQueenFromF6ToG5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: G5), boardState: boardState))
    }
    
    func testMoveBlackQueenFromF6ToG5ToH4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: G5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: G5, toSquare: H4), boardState: boardState))
    }
    
    func testMoveBlackQueenFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: A1, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testMoveBlackQueenFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: H1, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: H1, toSquare: A8), boardState: boardState))
    }
    
    func testMoveBlackQueenFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F1), boardState: boardState))
    }
    
    func testMoveBlackQueenFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F2), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: F2, toSquare: A2), boardState: boardState))
    }
}
