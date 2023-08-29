//
//  EvaluationValueHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 06/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol EvaluationValueHandlerProtocol {
    
    func getValue(for gameState: GameState) -> Int

}

struct EvaluationValueHandler {
    
    private enum Constants {
        static let pieceValueWeight = 100
        static let mobilityValueWeight = 1
    }

    private let piecesHandler: PiecesHandlerProtocol
    private let moveGenerationHandler: MoveGenerationHandler

    init(
        piecesHandler: PiecesHandlerProtocol,
        moveGenerationHandler: MoveGenerationHandler
    ) {
        self.piecesHandler = piecesHandler
        self.moveGenerationHandler = moveGenerationHandler
    }

}

extension EvaluationValueHandler: EvaluationValueHandlerProtocol {
    
    func getValue(for gameState: GameState) -> Int {
        
        // For current player
        let currentPlayerPieces = piecesHandler.currentPlayerPieces(gameState: gameState)
        let currentPieceValueSum = abs(pieceValueSum(squares: currentPlayerPieces))
        let currentMobilityValueSum = mobilityValueSum(squares: currentPlayerPieces, boardState: gameState.boardState)
        
        // For opponent player
        let opponentPlayerPieces = piecesHandler.opponentPlayerPieces(gameState: gameState)
        let opponentPieceValueSum = abs(pieceValueSum(squares: opponentPlayerPieces))
        let opponentMobilityValueSum = mobilityValueSum(squares: opponentPlayerPieces, boardState: gameState.boardState)
        
        // Final sum
        let finalPieceValueSum = currentPieceValueSum - opponentPieceValueSum
        let finalMobilityValueSum = currentMobilityValueSum - opponentMobilityValueSum
        return (finalPieceValueSum * Constants.pieceValueWeight) + (finalMobilityValueSum * Constants.mobilityValueWeight)
    }
    
    func pieceValueSum(squares: [SquareState]) -> Int {
        squares.reduce(0) { $0 + ($1.piece?.rawValue.value ?? 0) }
    }
    
    func mobilityValueSum(squares: [SquareState], boardState: any BoardStateProtocol) -> Int {
        squares.reduce(0) { (first, second) in
            first + moveGenerationHandler.getMoves(forPieceOn: second, boardState: boardState).count
        }
    }

}
