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
}

extension AIHandler: InputHandler {
    
    func input(gameState: GameState) {
        let boardState = gameState.boardState
        let squares = boardState.squares.flatMap { $0 }.filter { $0?.piece?.rawValue.color == gameState.currentPlayer.color }.compactMap { $0 }
        let moves = squares.flatMap { MoveGenerationHandler.getMoves(forPieceOn: $0, boardState: boardState) }
        let movesWithValues: [MoveState] = moves.compactMap {
            guard let boardState = boardState.copy() as? BoardState, BoardHandler.move($0, boardState: boardState) else { return nil }
            return MoveState(fromSquare: $0.fromSquare, toSquare: $0.toSquare, evaluationValue: EvaluationValueHandler.getValue(for: boardState))
        }.sorted(by: { $0.evaluationValue ?? 0 > $1.evaluationValue ?? 0 })
        guard let firstMove = movesWithValues.first else { return }
        inputHandlerDelegate?.didTakeInput(firstMove)
    }
}
