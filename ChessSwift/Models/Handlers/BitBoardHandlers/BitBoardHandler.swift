//
//  BoardHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class BitBoardHandler {

    private let legalMovesHandler: LegalMovesHandlerProtocol

    init(
        legalMovesHandler: LegalMovesHandlerProtocol
    ) {
        self.legalMovesHandler = legalMovesHandler
    }

}

extension BitBoardHandler: BoardHandlerProtocol {

    func setup(configuration: Constants.ChessBoardConfiguration.ConfigurationType) -> BoardStateProtocol {
        var rankCount = -1
        var fileCount = -1
        return BitBoardState(squares: configuration.map { rank in
            fileCount = -1
            rankCount += 1
            return rank.map { pieceValue in
                fileCount += 1
                guard let fileIndex = FileIndex(rawValue: fileCount), let rankIndex = RankIndex(rawValue: rankCount) else { return nil }
                return SquareState(fileIndex: fileIndex, rankIndex: rankIndex, piece: PieceFactory.getPiece(pieceValue))
            }
        })
    }

    func move(_ move: MoveState, boardState: BoardStateProtocol) -> BoardStateProtocol? {
        let fromSquare = move.fromSquare
        let toSquare = move.toSquare
        guard legalMovesHandler.move(move, boardState: boardState),
              let movingPiece = getPiece(on: fromSquare, boardState: boardState),
              let intermediateBoardState = putPiece(movingPiece, on: toSquare, boardState: boardState),
              let finalBoardState = putEmptyPiece(on: fromSquare, boardState: intermediateBoardState) else {
                return nil
        }
        return finalBoardState
    }

    func getPiece(on squareState: SquareState, boardState: BoardStateProtocol) -> Piece? {
        boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }

    func putPiece(_ piece: Piece, on squareState: SquareState, boardState: BoardStateProtocol) -> BoardStateProtocol? {
        var squares = boardState.squares
        guard var square = boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue] else { return nil }
        switch piece.rawValue.eligibleForPromotion {
        case .yes(let rankIndex, let promotionOptions):
            if square?.rankIndex == rankIndex {
                square?.piece = promotionOptions.last
            } else {
                square?.piece = piece
            }
        case .no:
            square?.piece = piece
        }
        squares[safe: square?.rankIndex.rawValue]?[safe: square?.fileIndex.rawValue] = square
        return BitBoardState(squares: squares)
    }

    private func putEmptyPiece(on squareState: SquareState, boardState: BoardStateProtocol) -> BoardStateProtocol? {
        var squares = boardState.squares
        guard var square = boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue] else { return nil }
        square?.piece = nil
        squares[safe: square?.rankIndex.rawValue]?[safe: square?.fileIndex.rawValue] = square
        return BitBoardState(squares: squares)
    }

}
