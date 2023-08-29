//
//  BoardHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol BoardHandlerProtocol {

    func setup(configuration: Constants.ChessBoardConfiguration.ConfigurationType) -> any BoardStateProtocol

    func move(_ move: MoveState, boardState: any BoardStateProtocol) -> (any BoardStateProtocol)?

    func getPiece(on squareState: SquareState, boardState: any BoardStateProtocol) -> Piece?

    func putPiece(_ piece: Piece, on squareState: SquareState, boardState: any BoardStateProtocol) -> (any BoardStateProtocol)?

}

class BoardHandler {

    private let legalMovesHandler: LegalMovesHandlerProtocol

    init(
        legalMovesHandler: LegalMovesHandlerProtocol
    ) {
        self.legalMovesHandler = legalMovesHandler
    }

}

extension BoardHandler: BoardHandlerProtocol {

    func setup(configuration: Constants.ChessBoardConfiguration.ConfigurationType) -> any BoardStateProtocol {
        var rankCount = -1
        var fileCount = -1
        return BoardState(
            state: configuration.map { rank in
                fileCount = -1
                rankCount += 1
                return rank.map { pieceValue in
                    fileCount += 1
                    guard let fileIndex = FileIndex(rawValue: fileCount), let rankIndex = RankIndex(rawValue: rankCount) else { return nil }
                    return .init(
                        fileIndex: fileIndex,
                        rankIndex: rankIndex,
                        piece: PieceFactory.getPiece(
                            pieceValue
                        )
                    )
                }
            }
        )
    }

    func move(_ move: MoveState, boardState: any BoardStateProtocol) -> (any BoardStateProtocol)? {
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

    func getPiece(on squareState: SquareState, boardState: any BoardStateProtocol) -> Piece? {
        let boardState = (boardState as? BoardState)
        return boardState?.state[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }

    func putPiece(_ piece: Piece, on squareState: SquareState, boardState: any BoardStateProtocol) -> (any BoardStateProtocol)? {
        let boardState = (boardState as? BoardState)
        guard var squares = boardState?.state,
              var square = squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue] else { return nil }
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
        return BoardState(state: squares)
    }

    private func putEmptyPiece(on squareState: SquareState, boardState: any BoardStateProtocol) -> (any BoardStateProtocol)? {
        let boardState = (boardState as? BoardState)
        guard var squares = boardState?.state,
              var square = squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue] else { return nil }
        square?.piece = nil
        squares[safe: square?.rankIndex.rawValue]?[safe: square?.fileIndex.rawValue] = square
        return BoardState(state: squares)
    }

}
