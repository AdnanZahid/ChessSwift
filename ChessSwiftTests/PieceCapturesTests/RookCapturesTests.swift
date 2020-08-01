//
//  RookCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class RookCapturesTests: XCTestCase {
    
    private var gameState: GameState!
    
    override func setUp() {
        super.setUp()
        let boardState = BoardState()
        let whitePlayer = PlayerState(isAI: false, color: .white, piecesList: [])
        let blackPlayer = PlayerState(isAI: false, color: .black, piecesList: [])
        gameState = GameState(boardState: boardState, whitePlayer: whitePlayer, blackPlayer: blackPlayer, currentPlayer: whitePlayer)
        BoardHandler.setup(boardState: gameState.boardState, configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        gameState = nil
        super.tearDown()
    }
    
    // White
    
    func testCaptureWhiteRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testCaptureWhiteRookFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(D5, E5), gameState: gameState))
    }

    func testCaptureWhiteRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F1, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, F1), gameState: gameState))
    }
    
    func testCaptureWhiteRookFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: A2, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, F2), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(F2, A2), gameState: gameState))
    }
    
    // Black
    
    func testCaptureBlackRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testCaptureBlackRookFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(D5, E5), gameState: gameState))
    }

    func testCaptureBlackRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F1, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, F1), gameState: gameState))
    }
    
    func testCaptureBlackRookFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: A2, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, F2), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(F2, A2), gameState: gameState))
    }
}
