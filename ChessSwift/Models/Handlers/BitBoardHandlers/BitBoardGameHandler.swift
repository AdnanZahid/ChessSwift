//
//  GameHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class BitBoardGameHandler {

    private let boardHandler: BoardHandlerProtocol

    init(
        boardHandler: BoardHandlerProtocol
    ) {
        self.boardHandler = boardHandler
    }

}

extension BitBoardGameHandler: GameHandlerProtocol {

    func move(_ move: MoveState, gameState: GameState) -> GameState? {
        guard isCurrentPlayersMove(move, gameState: gameState),
              let boardState = boardHandler.move(move, boardState: gameState.boardState) else {
            return nil
        }
        return gameStateWithChangedTurns(gameState: gameState, boardState: boardState)
    }

    private func isCurrentPlayersMove(_ move: MoveState, gameState: GameState) -> Bool {
        gameState.currentPlayer.color == getPiece(on: move.fromSquare, boardState: gameState.boardState)?.rawValue.color
    }

    private func getPiece(on squareState: SquareState, boardState: BoardState) -> Piece? {
        boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }

    private func gameStateWithChangedTurns(gameState: GameState, boardState: BoardState) -> GameState {
        .init(
            boardState: boardState,
            whitePlayer: gameState.whitePlayer,
            blackPlayer: gameState.blackPlayer,
            // Change turn
            currentPlayer: gameState.currentPlayer.color == .white ? gameState.blackPlayer : gameState.whitePlayer
        )
    }
}
