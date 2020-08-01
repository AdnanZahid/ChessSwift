//
//  GameHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class GameHandler {
    
    static func move(_ move: MoveState, gameState: GameState) -> Bool {
        return BoardHandler.move(move, boardState: gameState.boardState)
    }
}
