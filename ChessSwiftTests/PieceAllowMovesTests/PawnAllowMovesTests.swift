//
//  PawnAllowMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class PawnAllowMovesTests: XCTestCase {
    
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
    
    func testMoveWhitePawnFromA2ToA4() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(A2, A3), boardState: boardState))
    }
    
    func testMoveWhitePawnFromA2ToA4ToA5() {
        XCTAssertTrue(BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(A2, A4), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(A4, A5), boardState: boardState))
    }
    
    // Black
    
    func testMoveBlackPawnFromG7ToG5() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(G7, G6), boardState: boardState))
    }
    
    func testMoveBlackPawnFromG7ToG5ToG4() {
        XCTAssertTrue(BoardHandler.putPiece(.blackPawn, on: G7, boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(G7, G5), boardState: boardState))
        XCTAssertTrue(BoardHandler.move(MoveState(G5, G4), boardState: boardState))
    }
}
