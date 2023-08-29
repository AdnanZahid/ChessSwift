//
//  PiecesHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 25/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct BitBoardPiecesHandler {
}

extension BitBoardPiecesHandler: PiecesHandlerProtocol {
    
    func currentPlayerPieces(gameState: GameState) -> [SquareState] {
        allPieces(gameState: gameState).filter { $0.piece?.rawValue.color == gameState.currentPlayer.color }
    }
    
    func opponentPlayerPieces(gameState: GameState) -> [SquareState] {
        allPieces(gameState: gameState).filter { $0.piece?.rawValue.color != gameState.currentPlayer.color }
    }
    
    private func allPieces(gameState: GameState) -> [SquareState] {
        let boardState = (gameState.boardState as? BitBoardState)
        return boardState?.state.flatMap { $0 }.compactMap { $0 } ?? []
    }
}