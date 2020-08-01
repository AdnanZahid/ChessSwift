//
//  Controller.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class Controller {
    
    let gameState: GameState
    let outputHandler: OutputHandler
    var inputHandler: InputHandler
    
    init(view: OutputHandler) {
        gameState = GameState()
        inputHandler = view
        outputHandler = view
        inputHandler.inputHandlerDelegate = self
        BoardHandler.setup(boardState: gameState.boardState, configuration: Constants.ChessBoardConfiguration.standard)
        outputHandler.setup(boardState: gameState.boardState)
        selectQueueAndRun(.global(qos: .default)) { self.runEngine() }
    }
    
    func runEngine() {
        inputHandler.input()
    }
    
    func selectQueueAndRun(_ queue: DispatchQueue, action: @escaping () -> ()) {
        if !outputHandler.isGUIViewAvailable {
            action()
        } else {
            queue.async {
                action()
            }
        }
    }
}

extension Controller: InputHandlerDelegate {
    
    func didTakeInput(_ move: MoveState) {
        if GameHandler.move(move, gameState: gameState) {
            selectQueueAndRun(.main) { [unowned self] in self.outputHandler.output(move: move, boardState: self.gameState.boardState) }
        } else {
            selectQueueAndRun(.main) { [unowned self] in self.outputHandler.cancelMove() }
        }
        selectQueueAndRun(.global(qos: .default)) { self.runEngine() }
    }
}
