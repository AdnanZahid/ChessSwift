//
//  RookPossibleMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class RookPossibleMovesTests: XCTestCase {
    
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
    
    func testPossibleMovesWhiteRookFromA1() {
        boardState = BoardHandler.putPiece(.whiteRook, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A1, boardState: boardState)
        let testMoveStates = [B1, C1, D1, E1, F1, G1, H1, A2, A3, A4, A5, A6, A7, A8]
            .map { MoveState(fromSquare: A1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteRookFromD4FriendlyFire() {
        boardState = BoardHandler.putPiece(.whiteRook, on: D4, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: E4, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: D5, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: C4, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: D3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteRookFromD4EnemyFire() {
        boardState = BoardHandler.putPiece(.whiteRook, on: D4, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: E4, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: D5, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: C4, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: D3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [E4, D5, C4, D3].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    // Black
    
    func testPossibleMovesBlackRookFromA1() {
        boardState = BoardHandler.putPiece(.blackRook, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A1, boardState: boardState)
        let testMoveStates = [B1, C1, D1, E1, F1, G1, H1, A2, A3, A4, A5, A6, A7, A8]
            .map { MoveState(fromSquare: A1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackRookFromD4FriendlyFire() {
        boardState = BoardHandler.putPiece(.blackRook, on: D4, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: E4, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: D5, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: C4, boardState: boardState)
        boardState = BoardHandler.putPiece(.blackRook, on: D3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackRookFromD4EnemyFire() {
        boardState = BoardHandler.putPiece(.blackRook, on: D4, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: E4, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: D5, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: C4, boardState: boardState)
        boardState = BoardHandler.putPiece(.whiteRook, on: D3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [E4, D5, C4, D3].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
}
