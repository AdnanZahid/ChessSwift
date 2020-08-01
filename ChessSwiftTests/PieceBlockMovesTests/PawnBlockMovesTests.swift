//
//  PawnBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class PawnBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhitePawnFromA2ToA4() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A3, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(A2, A4), gameState: gameState))
    }
    
    func testBlockWhitePawnFromE2ToE3() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: E2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: E3, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(E2, E3), gameState: gameState))
    }
    
    // Black
    
    func testBlockBlackPawnFromG7ToG5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G7, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(G7, G5), gameState: gameState))
    }
    
    func testBlockBlackPawnFromB6ToB5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: B6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: B5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(B6, B5), gameState: gameState))
    }
}
