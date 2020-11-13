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
        static let maxDepth = 2
    }
}

extension BestMoveHandler {
    
    static func bestMove(gameState: GameState) -> MoveState? {
        let alpha = Int.min / 2
        let beta = Int.max / 2
        let depth = Constants.maxDepth
        var bestValue = Int.min / 2
        var bestMoveState: MoveState? = nil
        let moveStates = MemoizationHandler.MemoizedMoveGenerationHandler.getGameStateMoves(gameState)
        
        DispatchQueue.concurrentPerform(iterations: moveStates.count) { index in
            let moveState = moveStates[index]
            
            guard let localGameState = MemoizationHandler.MemoizedGameHandler.move(PairState(first: moveState, second: gameState)) else { return }
            var localAlpha = alpha
            let value = -MemoizationHandler.MemoizedBestMoveHandler.bestValue(QuadrupletState(first: depth - 1,
                                                                                              second: localGameState,
                                                                                              third: -beta,
                                                                                              fourth: -localAlpha))
            if value > bestValue {
                bestValue = value
                bestMoveState = moveState
            }
            if bestValue >= beta {
                return
            } else if bestValue > alpha {
                localAlpha = bestValue
            }
        }
        return bestMoveState
    }
    
    static func bestEvaluationValue(at depth: Int, gameState: GameState, alpha: Int, beta: Int) -> Int {
        if depth == 0 {
            let value = MemoizationHandler.MemoizedEvaluationValueHandler.getValue(gameState)
            if gameState.currentPlayer.color == .white {
                return value
            } else {
                return -value
            }
        }
        var bestValue = Int.min / 2
        let moveStates = MemoizationHandler.MemoizedMoveGenerationHandler.getGameStateMoves(gameState)
        
        DispatchQueue.concurrentPerform(iterations: moveStates.count) { index in
            let moveState = moveStates[index]
            
            guard let localGameState = MemoizationHandler.MemoizedGameHandler.move(PairState(first: moveState, second: gameState)) else { return }
            var localAlpha = alpha
            let value = -MemoizationHandler.MemoizedBestMoveHandler.bestValue(QuadrupletState(first: depth - 1,
                                                                                              second: localGameState,
                                                                                              third: -beta,
                                                                                              fourth: -localAlpha))
            if value > bestValue {
                bestValue = value
            }
            if bestValue >= beta {
                return
            } else if bestValue > alpha {
                localAlpha = bestValue
            }
        }
        return bestValue
    }
}
