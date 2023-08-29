//
//  BestMoveHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 25/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct BitBoardBestMoveHandler {

    private enum Constants {
        static let maxDepth = 2
    }

    private let gameHandler: GameHandlerProtocol
    private let boardHandler: BoardHandlerProtocol
    private let moveGenerationHandler: MoveGenerationHandlerProtocol
    private let evaluationValueHandler: EvaluationValueHandlerProtocol

    init(
        gameHandler: GameHandlerProtocol,
        boardHandler: BoardHandlerProtocol,
        moveGenerationHandler: MoveGenerationHandlerProtocol,
        evaluationValueHandler: EvaluationValueHandlerProtocol
    ) {
        self.gameHandler = gameHandler
        self.boardHandler = boardHandler
        self.moveGenerationHandler = moveGenerationHandler
        self.evaluationValueHandler = evaluationValueHandler
    }

}

extension BitBoardBestMoveHandler: BestMoveHandlerProtocol {

    func bestMove(gameState: GameState) -> MoveState? {
        let alpha = Int.min / 2
        let beta = Int.max / 2
        var bestValue = Int.min / 2
        var bestMoveState: MoveState? = nil
        let moveStates = moveGenerationHandler.getMoves(gameState)

        DispatchQueue.concurrentPerform(iterations: moveStates.count) { index in
            let moveState = moveStates[index]
            let piece = boardHandler.getPiece(on: moveState.fromSquare, boardState: gameState.boardState)
            guard var depth = piece?.rawValue.value,
                  let localGameState = gameHandler.move(moveState, gameState: gameState) else { return }
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

    private func bestEvaluationValue(at depth: Int, gameState: GameState, alpha: Int, beta: Int) -> Int {
        if depth == 0 { return evaluationValueHandler.getValue(for: gameState) }
        var bestValue = Int.min / 2
        let moveStates = moveGenerationHandler.getMoves(gameState)

        for moveState in moveStates {
            guard let localGameState = gameHandler.move(moveState, gameState: gameState) else { break }
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
