//
//  PawnPossibleMovesTests.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import XCTest

class PawnPossibleMovesTests: XCTestCase {
    
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
    
    func testPossibleMovesWhitePawnFromA2() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A2, boardState: boardState)
        let testMoveStates = [A3, A4].map { MoveState(fromSquare: A2, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhitePawnFromD3() {
        boardState = BoardHandler.putPiece(.whitePawn, on: D3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D3, boardState: boardState)
        let testMoveStates = [D4].map { MoveState(fromSquare: D3, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhitePawnFromA2WhileCapturingOnB3() {
        boardState = BoardHandler.putPiece(.whitePawn, on: A2, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackPawn, on: B3, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: A2, boardState: boardState)
        let testMoveStates = [A3, A4, B3].map { MoveState(fromSquare: A2, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesWhitePawnFromD3WhileCapturingOnC4AndE4() {
        boardState = BoardHandler.putPiece(.whitePawn, on: D3, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackPawn, on: C4, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.blackPawn, on: E4, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: D3, boardState: boardState)
        let testMoveStates = [D4, E4, C4].map { MoveState(fromSquare: D3, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    // Black
    
    func testPossibleMovesBlackPawnFromH7() {
        boardState = BoardHandler.putPiece(.blackPawn, on: H7, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: H7, boardState: boardState)
        let testMoveStates = [H6, H5].map { MoveState(fromSquare: H7, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackPawnFromE6() {
        boardState = BoardHandler.putPiece(.blackPawn, on: E6, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: E6, boardState: boardState)
        let testMoveStates = [E5].map { MoveState(fromSquare: E6, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackPawnFromH7WhileCapturingOnG6() {
        boardState = BoardHandler.putPiece(.blackPawn, on: H7, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whitePawn, on: G6, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: H7, boardState: boardState)
        let testMoveStates = [H6, H5, G6].map { MoveState(fromSquare: H7, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
    
    func testPossibleMovesBlackPawnFromE6WhileCapturingOnD5AndF5() {
        boardState = BoardHandler.putPiece(.blackPawn, on: E6, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whitePawn, on: D5, boardState: boardState)
        XCTAssertNotNil(boardState)
        boardState = BoardHandler.putPiece(.whitePawn, on: F5, boardState: boardState)
        XCTAssertNotNil(boardState)
        let moveStates = MoveGenerationHandler.getMoves(forPieceOn: E6, boardState: boardState)
        let testMoveStates = [E5, F5, D5].map { MoveState(fromSquare: E6, toSquare: $0) }
        XCTAssertEqual(moveStates, testMoveStates)
    }
}
