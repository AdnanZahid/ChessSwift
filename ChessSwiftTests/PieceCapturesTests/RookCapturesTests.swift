//
//  RookCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class RookCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhiteRookFromD4ToD5() {
        boardState = BoardHandler.putPiece(.whiteRook, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testCaptureWhiteRookFromD4ToD5ToE5() {
        boardState = BoardHandler.putPiece(.whiteRook, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: E5, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: D5, toSquare: E5), boardState: boardState))
    }

    func testCaptureWhiteRookFromF6ToF1() {
        boardState = BoardHandler.putPiece(.whiteRook, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: F1, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F1), boardState: boardState))
    }
    
    func testCaptureWhiteRookFromF6ToF2ToA2() {
        boardState = BoardHandler.putPiece(.whiteRook, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: F2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: F6, toSquare: F2), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: F2, toSquare: A2), boardState: boardState))
    }
    
    // Black
    
    func testCaptureBlackRookFromD4ToD5() {
        boardState = BoardHandler.putPiece(.blackRook, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState))
    }
    
    func testCaptureBlackRookFromD4ToD5ToE5() {
        boardState = BoardHandler.putPiece(.blackRook, on: D4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: E5, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: D4, toSquare: D5), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: D5, toSquare: E5), boardState: boardState))
    }

    func testCaptureBlackRookFromF6ToF1() {
        boardState = BoardHandler.putPiece(.blackRook, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: F1, boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: F6, toSquare: F1), boardState: boardState))
    }
    
    func testCaptureBlackRookFromF6ToF2ToA2() {
        boardState = BoardHandler.putPiece(.blackRook, on: F6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: F2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.move(MoveState(fromSquare: F6, toSquare: F2), boardState: boardState)
        XCTAssertNotNil(boardState)
        XCTAssertNotNil(BoardHandler.move(MoveState(fromSquare: F2, toSquare: A2), boardState: boardState))
    }
}
