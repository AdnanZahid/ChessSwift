//
//  QueenPossibleMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class QueenPossibleMovesTests: XCTestCase {
    
    private var boardState: BoardState!
    
    override func setUp() {
        super.setUp()
        boardState = BoardState()
        BoardHandler.setup(boardState: boardState, configuration: Constants.ChessBoardConfiguration.empty)
    }
    
    override func tearDown() {
        boardState = nil
        super.tearDown()
    }
    
    // White
    
    func testPossibleMovesWhiteQueenFromA1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: A1, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A1, boardState: boardState)
        let testMoveStates = [B2, C3, D4, E5, F6, G7, H8, B1, C1, D1, E1, F1, G1, H1, A2, A3, A4, A5, A6, A7, A8]
            .map { MoveState(fromSquare: A1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteQueenFromD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D5, boardState: boardState)
        let testMoveStates = [E6, F7, G8, E4, F3, G2, H1, C6, B7, A8, C4, B3, A2, E5, F5, G5, H5, D6, D7, D8, C5, B5, A5, D4, D3, D2, D1]
            .map { MoveState(fromSquare: D5, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteQueenFromD4FriendlyFire() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: C5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: C3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: C4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D3, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [].map { MoveState(fromSquare: D5, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteQueenFromD4EnemyFire() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: C5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: C3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: C4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D3, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [E5, E3, C5, C3, E4, D5, C4, D3].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    // Black
    
    func testPossibleMovesBlackQueenFromA1() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: A1, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A1, boardState: boardState)
        let testMoveStates = [B2, C3, D4, E5, F6, G7, H8, B1, C1, D1, E1, F1, G1, H1, A2, A3, A4, A5, A6, A7, A8]
            .map { MoveState(fromSquare: A1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackQueenFromD5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D5, boardState: boardState)
        let testMoveStates = [E6, F7, G8, E4, F3, G2, H1, C6, B7, A8, C4, B3, A2, E5, F5, G5, H5, D6, D7, D8, C5, B5, A5, D4, D3, D2, D1]
            .map { MoveState(fromSquare: D5, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackQueenFromD4FriendlyFire() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: C5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: C3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: E4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: C4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D3, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [].map { MoveState(fromSquare: D5, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackQueenFromD4EnemyFire() {
        XCTAssertTrue(BoardHandler.putPiece(.blackQueen, on: D4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: C5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: C3, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: E4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D5, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: C4, boardState: boardState))
        XCTAssertTrue(BoardHandler.putPiece(.whiteQueen, on: D3, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D4, boardState: boardState)
        let testMoveStates = [E5, E3, C5, C3, E4, D5, C4, D3].map { MoveState(fromSquare: D4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
}
