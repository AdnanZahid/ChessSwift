//
//  KingBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KingBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteKingFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testBlockWhiteKingFromB4ToC4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: B4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: C4, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(B4, C4), gameState: gameState))
    }
    
    // Black
    
    func testBlockBlackKingFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: D5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testBlockBlackKingFromB4ToC4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: B4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: C4, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(B4, C4), gameState: gameState))
    }
}
