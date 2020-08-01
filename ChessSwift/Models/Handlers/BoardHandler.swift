//
//  BoardHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class BoardHandler {
}

extension BoardHandler: MoveHandler {
    
    static func move(_ move: MoveState, boardState: BoardState) -> Bool {
        guard LegalMovesHandler.move(move, boardState: boardState),
            let piece = getPiece(on: move.fromSquare, boardState: boardState),
            putPiece(piece, on: move.toSquare, boardState: boardState),
            putEmptyPiece(on: move.fromSquare, boardState: boardState) else { return false }
        return true
    }
}

extension BoardHandler {
    
    private static func putEmptyPiece(on squareState: SquareState, boardState: BoardState) -> Bool {
        guard var square = boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue] else { return false }
        square?.piece = nil
        boardState.squares[safe: square?.rankIndex.rawValue]?[safe: square?.fileIndex.rawValue] = square
        return true
    }
    
    static func getPiece(on squareState: SquareState, boardState: BoardState) -> Piece? {
        return boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }
    
    static func putPiece(_ piece: Piece, on squareState: SquareState, boardState: BoardState) -> Bool {
        guard var square = boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue] else { return false }
        square?.piece = piece
        boardState.squares[safe: square?.rankIndex.rawValue]?[safe: square?.fileIndex.rawValue] = square
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
                return SquareState(fileIndex: fileIndex, rankIndex: rankIndex, piece: PieceFactory.getPiece(pieceValue))
            }
        }
    }
}
