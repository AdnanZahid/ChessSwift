//
//  RookBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class RookBlockMovesTests: XCTestCase {
    
    private var board: BoardState!
    
    override func setUp() {
        super.setUp()
        board = BoardState()
    }
    
    override func tearDown() {
        board = nil
        super.tearDown()
    }
    
    func testBlockWhiteRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D5, boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, D5), boardState: board))
    }
    
    func testBlockWhiteRookFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D5, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: E5, boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, D5), boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(D5, E5), boardState: board))
    }

    func testBlockWhiteRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F1, boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(F6, F1), boardState: board))
    }
    
    func testBlockWhiteRookFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F4, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: C2, boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(F6, F2), boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(F2, A2), boardState: board))
    }
    
    func testBlockBlackRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D5, boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, D5), boardState: board))
    }
    
    func testBlockBlackRookFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D5, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: E5, boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(D4, D5), boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(D5, E5), boardState: board))
    }
    
    func testBlockBlackRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F1, boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(F6, F1), boardState: board))
    }
    
    func testBlockBlackRookFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F4, boardState: board))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: C2, boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(F6, F2), boardState: board))
        XCTAssertFalse(BoardHandler.move(MoveState(F2, A2), boardState: board))
    }
}
