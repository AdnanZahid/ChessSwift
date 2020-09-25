//
//  AIGameState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 15/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct AIGameState {
    let gameState: GameState
    var moveIndex = 0
}

extension AIGameState: Hashable {
}

extension AIGameState: Sequence, IteratorProtocol {
    
    typealias Element = MoveState
    
    mutating func next() -> MoveState? {
        guard let moveState = nextMoveState(gameState: gameState) else { return nil }
        moveIndex += 1
        return moveState
    }
    
    private func nextMoveState(gameState: GameState) -> MoveState? {
        let boardState = gameState.boardState
        let squares = currentPlayerSquares(gameState: gameState)
        let playerMoves = currentPlayerMoves(squares: squares, boardState: boardState)
        let moveState = playerMoves[safe: moveIndex]
        return moveState
    }
    
    private func currentPlayerSquares(gameState: GameState) -> [SquareState] {
        gameState.boardState.squares.flatMap { $0 }.filter { $0?.piece?.rawValue.color == gameState.currentPlayer.color }.compactMap { $0 }
    }
    
    private func currentPlayerMoves(squares: [SquareState], boardState: BoardState) -> [MoveState] {
        squares.flatMap { MemoizationHandler.MemoizedMoveGenerationHandler.getMoves(PairState(first: $0, second: boardState)) }
    }
}
