//
//  GameHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class GameHandler {
    
    static func isAITurn(gameState: GameState) -> Bool {
        gameState.currentPlayer.isAI
    }
    
    static func move(_ move: MoveState, gameState: GameState) -> GameState? {
        guard isCurrentPlayersMove(move, gameState: gameState),
              let boardState = MemoizationHandler.MemoizedBoardHandler.move(PairState(first: move, second: gameState.boardState)) else { return nil }
        return gameStateWithChangedTurns(gameState: gameState, boardState: boardState)
    }
    
    private static func isCurrentPlayersMove(_ move: MoveState, gameState: GameState) -> Bool {
        gameState.currentPlayer.color == getPiece(on: move.fromSquare, boardState: gameState.boardState)?.rawValue.color
    }
    
    private static func getPiece(on squareState: SquareState, boardState: BoardState) -> Piece? {
        boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }
    
    private static func gameStateWithChangedTurns(gameState: GameState, boardState: BoardState) -> GameState {
        GameState(boardState: boardState,
                  whitePlayer: gameState.whitePlayer,
                  blackPlayer: gameState.blackPlayer,
                  // Change turn
                  currentPlayer: gameState.currentPlayer.color == gameState.whitePlayer.color ? gameState.blackPlayer : gameState.whitePlayer)
    }
}
