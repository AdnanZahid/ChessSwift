//
//  BoardHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class BoardHandler {
    
    private static func getPiece(on squareState: SquareState, boardState: BoardState) -> Piece? {
        guard let piece = boardState.squares[safe: squareState.rank.rawValue]?[safe: squareState.file.rawValue]??.piece else { return nil }
        return piece
    }
    
    private static func putEmptyPiece(on squareState: SquareState, boardState: BoardState) -> Bool {
        guard var square = boardState.squares[safe: squareState.rank.rawValue]?[safe: squareState.file.rawValue] else { return false }
        square?.piece = nil
        boardState.squares[safe: square?.rank.rawValue]?[safe: square?.file.rawValue] = square
        return true
    }
}

extension BoardHandler: MoveHandler {
    
    static func move(_ move: MoveState, boardState: BoardState) -> Bool {
        guard LegalMovesHandler.move(move, boardState: boardState),
            let piece = getPiece(on: move.fromSquare, boardState: boardState),
            putPiece(piece, on: move.toSquare, boardState: boardState),
            putEmptyPiece(on: move.fromSquare, boardState: boardState) else { return false }
        return true
    }
    
    static func putPiece(_ piece: Piece, on squareState: SquareState, boardState: BoardState) -> Bool {
        guard var square = boardState.squares[safe: squareState.rank.rawValue]?[safe: squareState.file.rawValue],
            square?.piece == nil else { return false }
        square?.piece = piece
        boardState.squares[safe: square?.rank.rawValue]?[safe: square?.file.rawValue] = square
        return true
    }
    
    static func setup(boardState: BoardState, configuration: Constants.ChessBoardConfiguration.ConfigurationType) {
        var rankCount = -1
        var fileCount = -1
        boardState.squares = configuration.map { rank in
            fileCount = -1
            rankCount += 1
            return rank.map { pieceValue in
                fileCount += 1
                guard let fileIndex = FileIndex(rawValue: fileCount), let rankIndex = RankIndex(rawValue: rankCount) else { return nil }
                return SquareState(file: fileIndex, rank: rankIndex, piece: PieceFactory.getPiece(pieceValue))
            }
        }
    }
}
