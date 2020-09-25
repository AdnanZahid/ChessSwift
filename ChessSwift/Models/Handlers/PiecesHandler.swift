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
    
    static func piecesMovable(gameState: GameState) -> [SquareState] {
        gameState.boardState.squares.flatMap { $0 }
            .filter { $0?.piece?.rawValue.color == gameState.currentPlayer.color }.compactMap { $0 }
    }
}
