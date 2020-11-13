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
        let allPieces = PiecesHandler.allPieces(gameState: gameState)
        let movablePieces = PiecesHandler.movablePieces(gameState: gameState)
        let pieceValueSum = EvaluationValueHandler.pieceValueSum(squares: allPieces)
        let mobilityValueSum = EvaluationValueHandler.mobilityValueSum(squares: movablePieces, boardState: gameState.boardState)
        return (pieceValueSum * Constants.pieceValueWeight) + (mobilityValueSum * Constants.mobilityValueWeight)
    }
    
    static func pieceValueSum(squares: [SquareState]) -> Int {
        squares.reduce(0) { $0 + ($1.piece?.rawValue.value ?? 0) }
    }
    
    static func mobilityValueSum(squares: [SquareState], boardState: BoardState) -> Int {
        squares.reduce(0) { (first, second) in
            return first + MoveGenerationHandler.getMoves(forPieceOn: second, boardState: boardState).count
        }
    }
}
