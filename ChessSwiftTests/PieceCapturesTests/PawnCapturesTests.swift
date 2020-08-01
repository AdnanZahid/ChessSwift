//
//  PawnCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class PawnCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhitePawnFromA2ToB3() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: B3, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(A2, B3), gameState: gameState))
    }
    
    func testCaptureWhitePawnFromA2ToA4ToA5() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: A4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: B5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(A2, A4), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(A4, B5), gameState: gameState))
    }
    
    // Black
    
    func testCaptureBlackPawnFromG7ToF6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G7, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(G7, F6), gameState: gameState))
    }
    
    func testCaptureBlackPawnFromG7ToF6ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G7, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(G7, F6), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, E5), gameState: gameState))
    }
}
