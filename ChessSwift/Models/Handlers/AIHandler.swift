//
//  AIHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 02/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class AIHandler {
    
    private enum Constants {
        static let maxDepth = 4
    }
    
    weak var inputHandlerDelegate: InputHandlerDelegate?
}

extension AIHandler: InputHandler {
    
    func input(gameState: GameState) {
        guard let moveState = firstMinimax(depth: Constants.maxDepth, gameState: gameState) else { return }
        inputHandlerDelegate?.didTakeInput(moveState)
    }
    
    func firstMinimax(depth: Int, gameState: GameState) -> MoveState? {
        var bestValue: Int
        var bestMoveState: MoveState? = nil
        if gameState.currentPlayer.color == .white {
            bestValue = Int.min
        } else {
            bestValue = Int.max
        }
        for moveState in AIGameState(gameState: gameState) {
            guard let gameState = GameHandler.move(moveState, gameState: gameState) else { break }
            let value = minimax(depth: depth - 1, gameState: gameState)
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
    
    func minimax(depth: Int, gameState: GameState) -> Int {
        
        if depth == 0 {
            if gameState.currentPlayer.color == .white {
                return EvaluationValueHandler.getValue(for: gameState.boardState, player: gameState.currentPlayer)
            } else {
                return -EvaluationValueHandler.getValue(for: gameState.boardState, player: gameState.currentPlayer)
            }
        }
        
        var bestValue: Int
        if gameState.currentPlayer.color == .white {
            bestValue = Int.min
        } else {
            bestValue = Int.max
        }
        for moveState in AIGameState(gameState: gameState) {
            guard let gameState = GameHandler.move(moveState, gameState: gameState) else { break }
            let value = minimax(depth: depth - 1, gameState: gameState)
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
