//
//  QueenBlockMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class QueenBlockMovesTests: XCTestCase {
    
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
    
    func testBlockWhiteQueenFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testBlockWhiteQueenFromD4ToF6() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, F6), gameState: gameState))
    }
    
    func testBlockWhiteQueenFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: A1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(A1, H8), gameState: gameState))
    }
    
    func testBlockWhiteQueenFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: H1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(H1, A8), gameState: gameState))
    }
    
    func testBlockWhiteQueenFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F3, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(F6, F1), gameState: gameState))
    }
    
    // Black
    
    func testBlockBlackQueenFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testBlockBlackQueenFromD4ToF6() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(D4, F6), gameState: gameState))
    }
    
    func testBlockBlackQueenFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: A1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(A1, H8), gameState: gameState))
    }
    
    func testBlockBlackQueenFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: H1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(H1, A8), gameState: gameState))
    }
    
    func testBlockBlackQueenFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F3, boardState: gameState.boardState))
        XCTAssertFalse(GameHandler.move(MoveState(F6, F1), gameState: gameState))
    }
}
