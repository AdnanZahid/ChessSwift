//
//  KnightCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KnightCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhiteKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: E6, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, E6), gameState: gameState))
    }
    
    func testCaptureWhiteKnightFromD4ToC2ToE1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: C2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: E1, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, C2), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(C2, E1), gameState: gameState))
    }
    
    // Black
    
    func testCaptureBlackKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: E6, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, E6), gameState: gameState))
    }
    
    func testCaptureBlackKnightFromD4ToC2ToE1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: C2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: E1, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, C2), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(C2, E1), gameState: gameState))
    }
}
