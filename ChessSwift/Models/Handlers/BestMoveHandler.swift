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
        static let maxDepth = 3
    }
}

extension BestMoveHandler {
    
    static func bestMove(gameState: GameState) -> MoveState? {
        let alpha = Int.min / 2
        let beta = Int.max / 2
        var bestValue = Int.min / 2
        var bestMoveState: MoveState? = nil
        let moveStates = MoveGenerationHandler.getMoves(gameState)
        
        DispatchQueue.concurrentPerform(iterations: moveStates.count) { index in
            let moveState = moveStates[index]
            let piece = BoardHandler.getPiece(on: moveState.fromSquare, boardState: gameState.boardState)
            guard var depth = piece?.rawValue.value,
                  let localGameState = GameHandler.move(moveState, gameState: gameState) else { return }
            depth = abs(depth/100)
            var localAlpha = alpha
            let value = -bestEvaluationValue(at: min(depth, Constants.maxDepth) - 1,
                                             gameState: localGameState,
                                             alpha: -beta,
                                             beta: -localAlpha)
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
        if depth == 0 { return EvaluationValueHandler.getValue(for: gameState) }
        var bestValue = Int.min / 2
        let moveStates = MoveGenerationHandler.getMoves(gameState)
        
        for moveState in moveStates {
            guard let localGameState = GameHandler.move(moveState, gameState: gameState) else { break }
            var localAlpha = alpha
            let value = -bestEvaluationValue(at: depth - 1,
                                             gameState: localGameState,
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
