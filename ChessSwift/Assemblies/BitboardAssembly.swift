//
//  BitboardAssembly.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 29.08.23.
//  Copyright © 2023 Adnan Zahid. All rights reserved.
//

import Foundation

struct BitboardAssembly: AssemblyProtocol {

    static var handlers: Handlers {
        let piecesHandler: BitBoardPiecesHandler
        let movementStrategyHandler: BitBoardMovementStrategyHandler
        let movementTypeHandler: BitBoardMovementTypeHandler
        let movementDirectionHandler: BitBoardMovementDirectionHandler
        let gameHandler: BitBoardGameHandler
        let boardHandler: BitBoardHandler
        let aiHandler: BitBoardAIHandler
        let moveGenerationHandler: BitBoardMoveGenerationHandler
        let evaluationValueHandler: BitBoardEvaluationValueHandler
        let legalMovesHandler: BitBoardLegalMovesHandler
        let bestMoveHandler: BitBoardBestMoveHandler
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
