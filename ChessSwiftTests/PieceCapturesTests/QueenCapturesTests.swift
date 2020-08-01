//
//  QueenCapturesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class QueenCapturesTests: XCTestCase {
    
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
    
    func testCaptureWhiteQueenFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: A1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: H8, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(A1, H8), gameState: gameState))
    }
    
    func testCaptureWhiteQueenFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: H1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: A8, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(H1, A8), gameState: gameState))
    }
    
    func testCaptureWhiteQueenFromD4ToE5ToF4() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: F4, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D5, E5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(E5, F4), gameState: gameState))
    }
    
    func testCaptureWhiteRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testCaptureWhiteRookFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(D5, E5), gameState: gameState))
    }

    func testCaptureWhiteRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F1, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, F1), gameState: gameState))
    }
    
    func testCaptureWhiteRookFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: A2, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, F2), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(F2, A2), gameState: gameState))
    }
    
    // Black
    
    func testCaptureBlackQueenFromA1ToH8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: A1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: H8, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(A1, H8), gameState: gameState))
    }
    
    func testCaptureBlackQueenFromH1ToA8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: H1, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: A8, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(H1, A8), gameState: gameState))
    }
    
    func testCaptureBlackQueenFromD4ToE5ToF4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: F4, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D5, E5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(E5, F4), gameState: gameState))
    }
    
    func testCaptureBlackRookFromD4ToD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
    }
    
    func testCaptureBlackRookFromD4ToD5ToE5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: D4, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: D5, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: E5, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(D4, D5), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(D5, E5), gameState: gameState))
    }

    func testCaptureBlackRookFromF6ToF1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F1, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, F1), gameState: gameState))
    }
    
    func testCaptureBlackRookFromF6ToF2ToA2() {
        XCTAssertTrue(BoardHandler.putPiece(.blackRook, on: F6, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: F2, boardState: gameState.boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteRook, on: A2, boardState: gameState.boardState))
        XCTAssertTrue(GameHandler.move(MoveState(F6, F2), gameState: gameState))
        XCTAssertTrue(GameHandler.move(MoveState(F2, A2), gameState: gameState))
    }
}
