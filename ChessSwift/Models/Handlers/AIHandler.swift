//
//  AIHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 02/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class AIHandler {
    weak var inputHandlerDelegate: InputHandlerDelegate?
    
    var count = 1
}

extension AIHandler: InputHandler {
    
    func input(gameState: GameState) {
        guard let move = bestMove(gameState: gameState) else {
            print("Nil")
            return
        }
        inputHandlerDelegate?.didTakeInput(move)
    }
    
    private func bestMove(gameState: GameState) -> MoveState? {
        count -= 1
        let boardState = gameState.boardState
        let squares = currentPlayerSquares(gameState: gameState)
        let playerMoves = currentPlayerMoves(squares: squares, boardState: boardState)
        let moves = movesWithValues(playerMoves, boardState: boardState)
        guard let move = moves.first,
            let intermediateGameState = GameHandler.move(move, gameState: gameState) else {
                print("Nil")
                return nil
        }
        let finalGameState = gameStateWithChangedTurn(gameState: intermediateGameState)
        if count == 0 {
            count = 1
            return move
        } else {
            return bestMove(gameState: finalGameState)
        }
    }
    
    private func currentPlayerSquares(gameState: GameState) -> [SquareState] {
        gameState.boardState.squares.flatMap { $0 }.filter { $0?.piece?.rawValue.color == gameState.currentPlayer.color }.compactMap { $0 }
    }
    
    private func currentPlayerMoves(squares: [SquareState], boardState: BoardState) -> [MoveState] {
        squares.flatMap { MoveGenerationHandler.getMoves(forPieceOn: $0, boardState: boardState) }
    }
    
    private func movesWithValues(_ moves: [MoveState], boardState: BoardState) -> [MoveState] {
        moves.compactMap {
            let boardStateCopy = BoardState(squares: boardState.squares)
            guard let finalBoardState = BoardHandler.move($0, boardState: boardStateCopy) else {
                print("Nil")
                return nil
            }
            return MoveState(fromSquare: $0.fromSquare, toSquare: $0.toSquare, evaluationValue: EvaluationValueHandler.getValue(for: finalBoardState))
        }.sorted(by: { $0.evaluationValue ?? 0 > $1.evaluationValue ?? 0 })
    }
    
    private func gameStateWithChangedTurn(gameState: GameState) -> GameState {
        return GameState(boardState: gameState.boardState,
                         whitePlayer: gameState.whitePlayer,
                         blackPlayer: gameState.blackPlayer,
                         currentPlayer: gameState.currentPlayer.color == gameState.whitePlayer.color ? gameState.blackPlayer : gameState.whitePlayer)
    }
}
