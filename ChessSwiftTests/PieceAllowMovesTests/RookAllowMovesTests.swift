//
//  RookAllowMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class RookAllowMovesTests: XCTestCase {
    
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
    
    func testMoveWhiteRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, D5), boardState: boardState))
    }
    
    func testMoveWhiteRookFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, D5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D5, E5), boardState: boardState))
    }
    
    func testMoveWhiteRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(F6, F1), boardState: boardState))
    }
    
    func testMoveWhiteRookFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(F6, F2), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(F2, A2), boardState: boardState))
    }
    
    // Black
    
    func testMoveBlackRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, D5), boardState: boardState))
    }
    
    func testMoveBlackRookFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D4, D5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(D5, E5), boardState: boardState))
    }
    
    func testMoveBlackRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(F6, F1), boardState: boardState))
    }
    
    func testMoveBlackRookFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(F6, F2), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(F2, A2), boardState: boardState))
    }
}
