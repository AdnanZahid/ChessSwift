//
//  EvaluationValueHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 06/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class EvaluationValueHandler {
    
    static func getValue(for boardState: BoardState) -> Int {
        let pieces = boardState.squares.flatMap { $0 }.compactMap { $0?.piece }
        let pieceSquares = boardState.squares.flatMap { $0 }.compactMap { $0 }
        let pieceValueSum = pieces.reduce(0) { $0 + $1.rawValue.value }
        let mobilityValueSum = pieceSquares.reduce(0) { $0 + MoveGenerationHandler.getMoves(forPieceOn: $1, boardState: boardState).count }
        return mobilityValueSum
    }
}
