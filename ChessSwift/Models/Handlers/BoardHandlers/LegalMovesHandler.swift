//
//  LegalMovesHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 01/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol LegalMovesHandlerProtocol {
    
    func move(_ move: MoveState, boardState: any BoardStateProtocol) -> Bool

}

class LegalMovesHandler {

    private let movementStrategyHandler: MovementStrategyHandlerProtocol
    private let movementTypeHandler: MovementTypeHandlerProtocol
    private let movementDirectionHandler: MovementDirectionHandler

    init(
        movementStrategyHandler: MovementStrategyHandlerProtocol,
        movementTypeHandler: MovementTypeHandlerProtocol,
        movementDirectionHandler: MovementDirectionHandler
    ) {
        self.movementStrategyHandler = movementStrategyHandler
        self.movementTypeHandler = movementTypeHandler
        self.movementDirectionHandler = movementDirectionHandler
    }

}

extension LegalMovesHandler: LegalMovesHandlerProtocol {
    
    func move(_ move: MoveState, boardState: any BoardStateProtocol) -> Bool {
        guard !isZeroStepAdvanced(for: move) else { return false }
        return isValid(move: move, boardState: boardState)
    }
    
    private func isValid(move: MoveState, boardState: any BoardStateProtocol) -> Bool {
        let fromSquare = move.fromSquare
        let toSquare = move.toSquare
        let targetPiece = getPiece(on: toSquare, boardState: boardState)
        guard let movingPiece = getPiece(on: fromSquare, boardState: boardState),
              isPiece(movingPiece, allowedToCapture: targetPiece) else { return false }
        let moveOrCaptureStrategies = targetPiece == nil ? movingPiece.rawValue.movementStrategies : movingPiece.rawValue.captureStrategies
        guard movementStrategyHandler.isValid(move: move, movementStrategies: moveOrCaptureStrategies),
              movementTypeHandler.isValid(move: move, movementTypes: movingPiece.rawValue.movementTypes, boardState: boardState),
              movementDirectionHandler.isValid(move: move, movementDirection: movingPiece.rawValue.movementDirection, color: movingPiece.rawValue.color) else { return false }
        return true
    }
    
    private func isZeroStepAdvanced(for move: MoveState) -> Bool {
        move.fromSquare == move.toSquare
    }
    
    private func getPiece(on squareState: SquareState, boardState: any BoardStateProtocol) -> Piece? {
        let boardState = (boardState as? BoardState)
        return boardState?.state[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }
    
    private func isPiece(_ movingPiece: Piece, allowedToCapture targetPiece: Piece?) -> Bool {
        guard targetPiece?.rawValue.allowedToBeCaptured ?? true else { return false }
        return targetPiece == nil || movingPiece.rawValue.color != targetPiece?.rawValue.color
    }
}
