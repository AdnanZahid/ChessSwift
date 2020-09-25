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
        let alpha = Int.min / 2
        let beta = Int.max / 2
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
            var localAlpha = alpha
            let value = bestEvaluationValue(at: depth - 1,
                                            gameState: gameState,
                                            alpha: -beta,
                                            beta: -localAlpha)
            if value > bestValue {
                bestValue = value
                bestMoveState = moveState
            }
            if bestValue >= beta {
                break
                
            } else if bestValue > alpha {
                localAlpha = bestValue
            }
        }
        return bestMoveState
    }
    
    private static func bestEvaluationValue(at depth: Int, gameState: GameState, alpha: Int, beta: Int) -> Int {
        
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
            var localAlpha = alpha
            let value = bestEvaluationValue(at: depth - 1,
                                            gameState: gameState,
                                            alpha: -beta,
                                            beta: -localAlpha)
            if value > bestValue {
                bestValue = value
            }
            if bestValue >= beta {
                break
                
            } else if bestValue > alpha {
                localAlpha = bestValue
            }
        }
        
        return bestValue
    }
}
