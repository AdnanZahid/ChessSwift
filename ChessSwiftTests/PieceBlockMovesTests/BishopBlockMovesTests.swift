//
//  BishopBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class BishopBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteBishopFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: A1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D4, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(A1, H8), gameState: gameState))
    }
    
    func testBlockWhiteBishopFromD1ToH5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: F3, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D1, H5), gameState: gameState))
    }
    
    // Black
    
    func testBlockBlackBishopFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: A1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: D4, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(A1, H8), gameState: gameState))
    }
    
    func testBlockBlackBishopFromD1ToH5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: D1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: F3, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D1, H5), gameState: gameState))
    }
}
