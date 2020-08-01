//
//  RookBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class RookBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }

    func testBlockWhiteRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F1, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(F6, F1), gameState: gameState))
    }
    
    // Black
    
    func testBlockBlackRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testBlockBlackRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F1, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(F6, F1), gameState: gameState))
    }
}
