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
    
    static func getValue(for boardState: BoardState, player: PlayerState) -> Int {
        let pieceSquares = boardState.squares.flatMap { $0 }.compactMap { $0 }.filter { $0.piece?.rawValue.color == player.color }
        let pieceValueSum = pieceSquares.compactMap { $0.piece }.reduce(0) { $0 + $1.rawValue.value }
        let mobilityValueSum = pieceSquares.reduce(0) { $0 + MemoizationHandler.MemoizedMoveGenerationHandler.getMoves(PairState(first: $1, second: boardState)).count }
        return (pieceValueSum * Constants.pieceValueWeight) + (mobilityValueSum * Constants.mobilityValueWeight)
    }
}
