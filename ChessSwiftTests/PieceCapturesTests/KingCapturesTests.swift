//
//  KingCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KingCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhiteKingFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testCaptureWhiteKingFromB4ToC5ToC6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: B4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: C5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: C6, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(B4, C5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(C5, C6), gameState: gameState))
    }
    
    // Black
    
    func testCaptureBlackKingFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testCaptureBlackKingFromB4ToC5ToC6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKing, on: B4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: C5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteKing, on: C6, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(B4, C5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(C5, C6), gameState: gameState))
    }
}
