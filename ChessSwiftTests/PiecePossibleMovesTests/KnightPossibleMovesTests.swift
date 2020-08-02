//
//  KnightPossibleMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KnightPossibleMovesTests: XCTestCase {
    
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
    
    func testPossibleMovesWhiteKnightFromA1() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: A1, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A1, boardState: boardState)
        let testMoveStates = [B3, C2].map { MoveState(fromSquare: A1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteKnightFromD5() {
        XCTAssertTrue(BoardHandler.putPiece(.whiteKnight, on: D5, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D5, boardState: boardState)
        let testMoveStates = [E7, F6, C7, B6, E3, F4, C3, B4].map { MoveState(fromSquare: D5, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    // Black
    
    func testPossibleMovesBlackKnightFromH8() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: H1, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: H1, boardState: boardState)
        let testMoveStates = [G3, F2].map { MoveState(fromSquare: H1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackKnightFromE4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackKnight, on: E4, boardState: boardState))
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: E4, boardState: boardState)
        let testMoveStates = [F6, G5, D6, C5, F2, G3, D2, C3].map { MoveState(fromSquare: E4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
}
