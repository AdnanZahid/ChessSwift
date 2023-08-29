//
//  Controller.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class Controller {
    
    var gameState: GameState?
    let outputHandler: OutputHandler
    var inputHandler: InputHandler
    let moveGenerationHandler: MoveGenerationHandlerProtocol
    let boardHandler: BoardHandlerProtocol
    let aiHandler: AIHandlerProtocol
    let gameHandler: GameHandlerProtocol

    init(view: OutputHandler) {
        // Change from array board to bit board here
        let handlers = BitBoardAssembly.handlers
        moveGenerationHandler = handlers.moveGenerationHandler
        boardHandler = handlers.boardHandler
        aiHandler = handlers.aiHandler
        gameHandler = handlers.gameHandler
        let boardState = boardHandler.setup(configuration: Constants.ChessBoardConfiguration.standard)
        let whitePlayer = PlayerState(isAI: true, color: .white)
        let blackPlayer = PlayerState(isAI: true, color: .black)
        gameState = GameState(boardState: boardState, whitePlayer: whitePlayer, blackPlayer: blackPlayer, currentPlayer: whitePlayer)
        inputHandler = view
        outputHandler = view
        outputHandler.setup(boardState: boardState)
        selectQueueAndRun(.global(qos: .default)) { self.runEngine() }
    }
}

extension Controller {
    
    private func runEngine() {
        guard let gameState = gameState else { return }
        inputHandler = gameState.currentPlayer.isAI ? aiHandler : outputHandler
        inputHandler.inputHandlerDelegate = self
        inputHandler.input(gameState: gameState)
    }
    
    private func selectQueueAndRun(_ queue: DispatchQueue, action: @escaping () -> ()) {
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
        guard let gameState = gameState else { return }
        self.gameState = gameHandler.move(move, gameState: gameState)
        if self.gameState != nil {
            selectQueueAndRun(.main) { [unowned self] in
                guard let gameState = self.gameState else { return }
                self.outputHandler.output(move: move, boardState: gameState.boardState)
            }
        } else {
            selectQueueAndRun(.main) { [unowned self] in
                self.outputHandler.cancelMove()
            }
        }
        selectQueueAndRun(.global(qos: .default)) { self.runEngine() }
    }
    
    func getMoves(forPieceOn squareState: SquareState) -> [MoveState] {
        guard let gameState = gameState else { return [] }
        return moveGenerationHandler.getMoves(forPieceOn: squareState, boardState: gameState.boardState)
    }
}
