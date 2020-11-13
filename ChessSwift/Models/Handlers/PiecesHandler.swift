//
//  PiecesHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 25/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class PiecesHandler {
}

extension PiecesHandler {
    
    static func allPieces(gameState: GameState) -> [SquareState] {
        gameState.boardState.squares.flatMap { $0 }.compactMap { $0 }
    }
    
    static func movablePieces(gameState: GameState) -> [SquareState] {
        PiecesHandler.allPieces(gameState: gameState)
            .filter { $0.piece?.rawValue.color == gameState.currentPlayer.color }
    }
}
