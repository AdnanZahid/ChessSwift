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
        guard let moveState = BestMoveHandler.bestMove(gameState: gameState) else { return }
        inputHandlerDelegate?.didTakeInput(moveState)
    }
}
