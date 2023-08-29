//
//  MoveGenerationHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 02/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol MoveGenerationHandlerProtocol {

    func getMoves(_ gameState: GameState) -> [MoveState]

    func getMoves(forPieceOn squareState: SquareState, boardState: any BoardStateProtocol) -> [MoveState]

}

struct MoveGenerationHandler {

    private let piecesHandler: PiecesHandlerProtocol
    private let legalMovesHandler: LegalMovesHandler

    init(
        piecesHandler: PiecesHandlerProtocol,
        legalMovesHandler: LegalMovesHandler
    ) {
        self.piecesHandler = piecesHandler
        self.legalMovesHandler = legalMovesHandler
    }

}

extension MoveGenerationHandler: MoveGenerationHandlerProtocol {

    func getMoves(_ gameState: GameState) -> [MoveState] {
        let squares = piecesHandler.currentPlayerPieces(gameState: gameState)
        let moves = currentPlayerMoves(squares: squares, boardState: gameState.boardState)
        return moves
    }

    func getMoves(forPieceOn squareState: SquareState, boardState: any BoardStateProtocol) -> [MoveState] {
        guard let piece = getPiece(on: squareState, boardState: boardState) else { return [] }
        // If movement strategies and capture strategies are same, calculate only once
        // Otherwise calculate for each one of them
        guard piece.rawValue.movementStrategies == piece.rawValue.captureStrategies else {
            var moveStates: [MoveState] = []
            moveStates.append(contentsOf: getMoves(for: piece.rawValue.movementStrategies, squareState: squareState, boardState: boardState))
            moveStates.append(contentsOf: getMoves(for: piece.rawValue.captureStrategies, squareState: squareState, boardState: boardState))
            return moveStates
        }
        return getMoves(for: piece.rawValue.movementStrategies, squareState: squareState, boardState: boardState)
    }
    
    func currentPlayerMoves(squares: [SquareState], boardState: any BoardStateProtocol) -> [MoveState] {
        squares.flatMap { getMoves(forPieceOn: $0, boardState: boardState) }
    }
    
    private func getPiece(on squareState: SquareState, boardState: any BoardStateProtocol) -> Piece? {
        let boardState = (boardState as? BoardState)
        return boardState?.state[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }
    
    private func getMoves(for movementStrategies: [MovementStrategy], squareState: SquareState, boardState: any BoardStateProtocol) -> [MoveState] {
        movementStrategies
            .flatMap { $0.rawValue }
            .flatMap { advancementState in
                getMoves(on: squareState, for: advancementState, boardState: boardState)
        }
    }
    
    private func getMoves(on squareState: SquareState, for advancementState: AdvancementState, boardState: any BoardStateProtocol) -> [MoveState] {
        var moveStates: [MoveState] = []
        var count = 1
        while let targetSquare = squareState + (advancementState * count) {
            let moveState = MoveState(fromSquare: squareState, toSquare: targetSquare)
            guard legalMovesHandler.move(moveState, boardState: boardState) else { return moveStates }
            moveStates.append(moveState)
            count += 1
        }
        return moveStates
    }
}
