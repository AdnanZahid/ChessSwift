//
//  LegalMovesHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 01/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class LegalMovesHandler {
}

extension LegalMovesHandler {
    
    static func move(_ move: MoveState, boardState: BoardState) -> Bool {
        guard !isZeroStepAdvanced(for: move) else { return false }
        return isValid(move: move, boardState: boardState)
    }
    
    private static func isValid(move: MoveState, boardState: BoardState) -> Bool {
        let fromSquare = move.fromSquare
        let toSquare = move.toSquare
        let targetPiece = getPiece(on: toSquare, boardState: boardState)
        guard let movingPiece = getPiece(on: fromSquare, boardState: boardState),
              isPiece(movingPiece, allowedToCapture: targetPiece) else { return false }
        let moveOrCaptureStrategies = targetPiece == nil ? movingPiece.rawValue.movementStrategies : movingPiece.rawValue.captureStrategies
        guard MemoizationHandler.MemoizedMovementStrategyHandler.isValid(PairState(first: move,
                                                                                   second: moveOrCaptureStrategies)),
              MemoizationHandler.MemoizedMovementTypeHandler.isValid(TripletState(first: move,
                                                                                  second: movingPiece.rawValue.movementTypes,
                                                                                  third: boardState)),
              MemoizationHandler.MemoizedMovementDirectionHandler.isValid(TripletState(first: move,
                                                                                       second: movingPiece.rawValue.movementDirection,
                                                                                       third: movingPiece.rawValue.color)) else { return false }
        return true
    }
    
    private static func isZeroStepAdvanced(for move: MoveState) -> Bool {
        move.fromSquare == move.toSquare
    }
    
    static func getPiece(on squareState: SquareState, boardState: BoardState) -> Piece? {
        boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }
    
    private static func isPiece(_ movingPiece: Piece, allowedToCapture targetPiece: Piece?) -> Bool {
        guard targetPiece?.rawValue.allowedToBeCaptured ?? true else { return false }
        return targetPiece == nil || movingPiece.rawValue.color != targetPiece?.rawValue.color
    }
}
