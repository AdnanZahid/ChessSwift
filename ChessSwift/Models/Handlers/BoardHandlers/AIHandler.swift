//
//  AIHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 02/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol AIHandlerProtocol: InputHandler {

    func input(gameState: GameState)

}

struct AIHandler {
    
    weak var inputHandlerDelegate: InputHandlerDelegate?
    
    private let bestMoveHandler: BestMoveHandlerProtocol

    init(
        bestMoveHandler: BestMoveHandlerProtocol
    ) {
        self.bestMoveHandler = bestMoveHandler
    }

}

extension AIHandler: AIHandlerProtocol {
    
    func input(gameState: GameState) {
        guard let moveState = bestMoveHandler.bestMove(gameState: gameState) else { return }
        inputHandlerDelegate?.didTakeInput(moveState)
    }
}