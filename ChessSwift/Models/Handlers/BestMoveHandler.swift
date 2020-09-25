//
//  BestMoveHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 25/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class BestMoveHandler {
    
    private enum Constants {
        static let maxDepth = 4
    }
}

extension BestMoveHandler {
    
    static func bestMove(gameState: GameState) -> MoveState? {
        let depth = Constants.maxDepth
        var bestValue: Int
        var bestMoveState: MoveState? = nil
        if gameState.currentPlayer.color == .white {
            bestValue = Int.min
        } else {
            bestValue = Int.max
        }
        let moveStates = MemoizationHandler.MemoizedMoveGenerationHandler.getGameStateMoves(gameState)
        for moveState in moveStates {
            guard let gameState = MemoizationHandler.MemoizedGameHandler.move(PairState(first: moveState, second: gameState)) else { break }
            let value = MemoizationHandler.MemoizedBestMoveHandler.bestValue(PairState(first: depth - 1, second: gameState))
            if gameState.currentPlayer.color == .black {
                if value > bestValue {
                    bestValue = value
                    bestMoveState = moveState
                }
            } else {
                if value < bestValue {
                    bestValue = value
                    bestMoveState = moveState
                }
            }
        }
        return bestMoveState
    }
    
    static func bestValue(depth: Int, gameState: GameState) -> Int {
        
        if depth == 0 {
            let value = MemoizationHandler.MemoizedEvaluationValueHandler.getValue(gameState)
            if gameState.currentPlayer.color == .white {
                return value
            } else {
                return -value
            }
        }
        
        var bestValue: Int
        if gameState.currentPlayer.color == .white {
            bestValue = Int.min
        } else {
            bestValue = Int.max
        }
        let moveStates = MemoizationHandler.MemoizedMoveGenerationHandler.getGameStateMoves(gameState)
        for moveState in moveStates {
            guard let gameState = MemoizationHandler.MemoizedGameHandler.move(PairState(first: moveState, second: gameState)) else { break }
            let value = MemoizationHandler.MemoizedBestMoveHandler.bestValue(PairState(first: depth - 1, second: gameState))
            if gameState.currentPlayer.color == .black {
                if value > bestValue {
                    bestValue = value
                }
            } else {
                if value < bestValue {
                    bestValue = value
                }
            }
        }
        
        return bestValue
    }
}
