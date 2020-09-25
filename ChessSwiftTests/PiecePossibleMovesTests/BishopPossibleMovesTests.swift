//
//  BishopPossibleMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class BishopPossibleMovesTests: XCTestCase {
    
    private var boardState: BoardState!
    
    override func setUp() {
        super.setUp()
        boardState = BoardHandler.setup(configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    // White
    
    func testPossibleMovesWhiteBishopFromA1() {
        boardState = BoardHandler.putPiece(.whiteBishop, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A1, boardState: boardState)
        let testMoveStates = [B2, C3, D4, E5, F6, G7, H8].map { MoveState(fromSquare: A1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteBishopFromD5() {
        boardState = BoardHandler.putPiece(.whiteBishop, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D5, boardState: boardState)
        let testMoveStates = [E6, F7, G8, E4, F3, G2, H1, C6, B7, A8, C4, B3, A2]
            .map { MoveState(fromSquare: D5, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteBishopFromD4FriendlyFire() {
        boardState = BoardHandler.putPiece(.whiteBishop, on: D4, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteBishop, on: E5, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteBishop, on: E3, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteBishop, on: C5, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteBishop, on: C3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteBishopFromD4EnemyFire() {
        boardState = BoardHandler.putPiece(.whiteBishop, on: D4, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: E5, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: E3, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: C5, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: C3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [E5, E3, C5, C3].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    // Black
    
    func testPossibleMovesBlackBishopFromA1() {
        boardState = BoardHandler.putPiece(.blackBishop, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A1, boardState: boardState)
        let testMoveStates = [B2, C3, D4, E5, F6, G7, H8].map { MoveState(fromSquare: A1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackBishopFromD5() {
        boardState = BoardHandler.putPiece(.blackBishop, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D5, boardState: boardState)
        let testMoveStates = [E6, F7, G8, E4, F3, G2, H1, C6, B7, A8, C4, B3, A2]
            .map { MoveState(fromSquare: D5, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackBishopFromD4FriendlyFire() {
        boardState = BoardHandler.putPiece(.blackBishop, on: D4, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: E5, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: E3, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: C5, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackBishop, on: C3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackBishopFromD4EnemyFire() {
        boardState = BoardHandler.putPiece(.blackBishop, on: D4, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteBishop, on: E5, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteBishop, on: E3, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteBishop, on: C5, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteBishop, on: C3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [E5, E3, C5, C3].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
}
