//
//  KingPossibleMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class KingPossibleMovesTests: XCTestCase {
    
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
    
    func testPossibleMovesWhiteKingFromA1() {
        boardState = BoardHandler.putPiece(.whiteKing, on: A1, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A1, boardState: boardState)
        let testMoveStates = [B2, B1, C1, A2].map { MoveState(fromSquare: A1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhiteKingFromD5() {
        boardState = BoardHandler.putPiece(.whiteKing, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D5, boardState: boardState)
        let testMoveStates = [E6, E4, C6, C4, E5, D6, C5, D4].map { MoveState(fromSquare: D5, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    // Black
    
    func testPossibleMovesBlackKingFromH8() {
        boardState = BoardHandler.putPiece(.blackKing, on: H1, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: H1, boardState: boardState)
        let testMoveStates = [G2, H2, G1, F1].map { MoveState(fromSquare: H1, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackKingFromE4() {
        boardState = BoardHandler.putPiece(.blackKing, on: E4, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: E4, boardState: boardState)
        let testMoveStates = [F5, F3, D5, D3, F4, E5, D4, E3].map { MoveState(fromSquare: E4, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
}
