//
//  Assembly.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 29.08.23.
//  Copyright © 2023 Adnan Zahid. All rights reserved.
//

import Foundation

typealias Handlers = (
    piecesHandler: PiecesHandlerProtocol,
    movementStrategyHandler: MovementStrategyHandlerProtocol,
    movementTypeHandler: MovementTypeHandlerProtocol,
    movementDirectionHandler: MovementDirectionHandlerProtocol,
    gameHandler: GameHandlerProtocol,
    boardHandler: BoardHandlerProtocol,
    aiHandler: AIHandlerProtocol,
    moveGenerationHandler: MoveGenerationHandlerProtocol,
    evaluationValueHandler: EvaluationValueHandlerProtocol,
    legalMovesHandler: LegalMovesHandlerProtocol,
    bestMoveHandler: BestMoveHandlerProtocol
)

protocol AssemblyProtocol {

    static var handlers: Handlers { get }

}

struct Assembly: AssemblyProtocol {

    static var handlers: Handlers {
        let piecesHandler: PiecesHandler
        let movementStrategyHandler: MovementStrategyHandler
        let movementTypeHandler: MovementTypeHandler
        let movementDirectionHandler: MovementDirectionHandler
        let gameHandler: GameHandler
        let boardHandler: BoardHandler
        let aiHandler: AIHandler
        let moveGenerationHandler: MoveGenerationHandler
        let evaluationValueHandler: EvaluationValueHandler
        let legalMovesHandler: LegalMovesHandler
        let bestMoveHandler: BestMoveHandler
        piecesHandler = .init()
        movementStrategyHandler = .init()
        movementTypeHandler = .init()
        movementDirectionHandler = .init()
        legalMovesHandler = .init(
            movementStrategyHandler: movementStrategyHandler,
            movementTypeHandler: movementTypeHandler,
            movementDirectionHandler: movementDirectionHandler
        )
        boardHandler = .init(
            legalMovesHandler: legalMovesHandler
        )
        gameHandler = .init(
            boardHandler: boardHandler
        )
        moveGenerationHandler = .init(
            piecesHandler: piecesHandler,
            legalMovesHandler: legalMovesHandler
        )
        evaluationValueHandler = .init(
            piecesHandler: piecesHandler,
            moveGenerationHandler: moveGenerationHandler
        )
        bestMoveHandler = .init(
            gameHandler: gameHandler,
            boardHandler: boardHandler,
            moveGenerationHandler: moveGenerationHandler,
            evaluationValueHandler: evaluationValueHandler
        )
        aiHandler = .init(
            bestMoveHandler: bestMoveHandler
        )
        return (
            piecesHandler,
            movementStrategyHandler,
            movementTypeHandler,
            movementDirectionHandler,
            gameHandler,
            boardHandler,
            aiHandler,
            moveGenerationHandler,
            evaluationValueHandler,
            legalMovesHandler,
            bestMoveHandler
        )
    }

}
