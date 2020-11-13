//
//  EvaluationValueHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 06/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class EvaluationValueHandler {
    
    private enum Constants {
        static let pieceValueWeight = 1
        static let mobilityValueWeight = 5
    }
}

extension EvaluationValueHandler {
    
    static func getValue(for gameState: GameState) -> Int {
        let allPieces = MemoizationHandler.MemoizedPiecesHandler.allPieces(gameState)
        let movablePieces = MemoizationHandler.MemoizedPiecesHandler.movablePieces(gameState)
        let pieceValueSum = MemoizationHandler.MemoizedEvaluationValueHandler.pieceValueSum(allPieces)
        let mobilityValueSum = MemoizationHandler.MemoizedEvaluationValueHandler.mobilityValueSum(PairState(first: movablePieces,
                                                                                                            second: gameState.boardState))
        return /*(pieceValueSum * Constants.pieceValueWeight) +*/ (mobilityValueSum * Constants.mobilityValueWeight)
    }
    
    static func pieceValueSum(squares: [SquareState]) -> Int {
        squares.reduce(0) { $0 + ($1.piece?.rawValue.value ?? 0) }
    }
    
    static func mobilityValueSum(squares: [SquareState], boardState: BoardState) -> Int {
        squares.reduce(0) { (first, second) in
            return first + MemoizationHandler.MemoizedMoveGenerationHandler.getBoardStateMoves(PairState(first: second, second: boardState)).count
        }
    }
}
