//
//  KnightBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KnightBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: E6, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, E6), gameState: gameState))
    }
    
    func testBlockWhiteKnightFromD4ToC2() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: C2, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, C2), gameState: gameState))
    }
    
    // Black
    
    func testBlockBlackKnightFromD4ToE6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: E6, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, E6), gameState: gameState))
    }
    
    func testBlockBlackKnightFromD4ToC2() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: C2, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, C2), gameState: gameState))
    }
}
