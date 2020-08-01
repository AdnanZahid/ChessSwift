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
        let fromSquare = move.fromSquare
        let toSquare = move.toSquare
        guard let movingPiece = getPiece(on: fromSquare, boardState: gameState.boardState) else { return false }
        let targetPiece = getPiece(on: toSquare, boardState: gameState.boardState)
        guard isPiece(movingPiece, targetPiece: targetPiece),
            BoardHandler.move(move, boardState: gameState.boardState) else { return false }
        return true
    }
    
    private static func isPiece(_ movingPiece: Piece, targetPiece: Piece?) -> Bool {
        return targetPiece == nil || movingPiece.rawValue.color != targetPiece?.rawValue.color
    }
    
    private static func getPiece(on squareState: SquareState, boardState: BoardState) -> Piece? {
        return boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }
}
