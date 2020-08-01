//
//  BishopCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class BishopCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhiteBishopFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: A1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: H8, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(A1, H8), gameState: gameState))
    }
    
    func testCaptureWhiteBishopFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: H1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: A8, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(H1, A8), gameState: gameState))
    }
    
    func testCaptureWhiteBishopFromD4ToE5ToF4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: F4, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, E5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(E5, F4), gameState: gameState))
    }
    
    // Black
    
    func testCaptureBlackBishopFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: A1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: H8, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(A1, H8), gameState: gameState))
    }
    
    func testCaptureBlackBishopFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: H1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: A8, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(H1, A8), gameState: gameState))
    }
    
    func testCaptureBlackBishopFromD4ToE5ToF4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackBishop, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteBishop, on: F4, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, E5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(E5, F4), gameState: gameState))
    }
}
