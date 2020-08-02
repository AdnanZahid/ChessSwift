//
//  BishopCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class BishopCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhiteBishopFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: A1, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: H8, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testCaptureWhiteBishopFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: H1, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: A8, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: H1, toSquare: A8), boardState: boardState))
    }
    
    func testCaptureWhiteBishopFromD4ToE5ToF4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: E5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: F4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: E5, toSquare: F4), boardState: boardState))
    }
    
    // Black
    
    func testCaptureBlackBishopFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: A1, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: H8, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: A1, toSquare: H8), boardState: boardState))
    }
    
    func testCaptureBlackBishopFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: H1, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: A8, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: H1, toSquare: A8), boardState: boardState))
    }
    
    func testCaptureBlackBishopFromD4ToE5ToF4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: E5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: F4, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: D4, toSquare: E5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(fromSquare: E5, toSquare: F4), boardState: boardState))
    }
}
