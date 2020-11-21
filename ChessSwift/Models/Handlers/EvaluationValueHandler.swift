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
        static let pieceValueWeight = 100
        static let mobilityValueWeight = 1
    }
}

extension EvaluationValueHandler {
    
    static func getValue(for gameState: GameState) -> Int {
        
        // For current player
        let currentPlayerPieces = PiecesHandler.currentPlayerPieces(gameState: gameState)
        let currentPieceValueSum = abs(pieceValueSum(squares: currentPlayerPieces))
        let currentMobilityValueSum = mobilityValueSum(squares: currentPlayerPieces, boardState: gameState.boardState)
        
        // For opponent player
        let opponentPlayerPieces = PiecesHandler.opponentPlayerPieces(gameState: gameState)
        let opponentPieceValueSum = abs(pieceValueSum(squares: opponentPlayerPieces))
        let opponentMobilityValueSum = mobilityValueSum(squares: opponentPlayerPieces, boardState: gameState.boardState)
        
        // Final sum
        let finalPieceValueSum = currentPieceValueSum - opponentPieceValueSum
        let finalMobilityValueSum = currentMobilityValueSum - opponentMobilityValueSum
        return (finalPieceValueSum * Constants.pieceValueWeight) + (finalMobilityValueSum * Constants.mobilityValueWeight)
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
