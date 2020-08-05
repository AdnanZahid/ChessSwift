//
//  AIHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 02/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class AIHandler {
    
    weak var inputHandlerDelegate: InputHandlerDelegate?
}

extension AIHandler: InputHandler {
    
    func input(boardState: BoardState) {
        let whitePieceSquares = boardState.squares.flatMap { $0 }.filter { $0?.piece?.rawValue.color == .white }.compactMap { $0 }
        let blackPieceSquares = boardState.squares.flatMap { $0 }.filter { $0?.piece?.rawValue.color == .black }.compactMap { $0 }
        
        let whiteMoves = whitePieceSquares.flatMap { MoveGenerationHandler.getMoves(forPieceOn: $0, boardState: boardState) }
        let blackMoves = blackPieceSquares.flatMap { MoveGenerationHandler.getMoves(forPieceOn: $0, boardState: boardState) }
        
        let whiteMovesSorted: [MoveState] = whiteMoves.compactMap {
            guard let boardState = boardState.copy() as? BoardState, BoardHandler.move($0, boardState: boardState) else { return nil }
            return MoveState(fromSquare: $0.fromSquare, toSquare: $0.toSquare, evaluationValue: EvaluationValueHandler.getValue(for: boardState))
        }.sorted(by: { $0.evaluationValue ?? 0 > $1.evaluationValue ?? 0 })
        
        guard let firstMove = whiteMovesSorted.first else { return }
        inputHandlerDelegate?.didTakeInput(firstMove)
    }
    
    //    private static func generateMove() -> MoveState? {
    //
    //
    //
    //        return nil
    //    }
    //
    //    private static func firstAlphaBeta(_ depth: Int, player: PlayerState, alpha: Int, beta: Int) -> MoveState {
    //
    //        var bestMove = EvaluationMove(fromSquare: nil, toSquare: nil, evaluationValue: Int.min/2)
    //
    //        for piece in player.piecesList {
    //
    //            if piece.captured == false {
    //
    //                let fromSquare: Square = piece.position!
    //
    //                for toSquare in (piece.moveStrategy?.generateAllMoves(fromSquare))! {
    //
    //                    if player.movePiece(Move(fromSquare: fromSquare, toSquare: toSquare), checkCurrentTurn: false) {
    //
    //                        var localAlpha = alpha
    //
    //                        let evaluationMove: EvaluationMove = EvaluationMove(fromSquare: fromSquare, toSquare: toSquare, evaluationValue: -alphaBeta(depth - 1, player: player.opponent!, alpha: -beta, beta: -localAlpha))
    //
    //
    //                        Board.sharedInstance.undoMove()
    //
    //
    //                        if evaluationMove.evaluationValue > bestMove.evaluationValue {
    //
    //                            bestMove = evaluationMove
    //                        }
    //
    //                        if bestMove.evaluationValue >= beta {
    //
    //                            break
    //
    //                        } else if bestMove.evaluationValue > alpha {
    //
    //                            localAlpha = bestMove.evaluationValue
    //                        }
    //                    }
    //                }
    //            }
    //        }
    //
    //        return bestMove
    //    }
    //
    //    static func alphaBeta(_ depth: Int, player: Player, alpha: Int, beta: Int) -> Int {
    //
    //        if depth == 0 {
    //
    //            if player.color == Color.white {
    //
    //                return Board.sharedInstance.evaluationValue
    //
    //            } else {
    //
    //                return -Board.sharedInstance.evaluationValue
    //            }
    //        }
    //
    //        var bestEvaluationValue = Int.min/2
    //
    //        for piece in player.piecesList {
    //
    //            if piece.captured == false {
    //
    //                let fromSquare: Square = piece.position!
    //
    //                for toSquare in (piece.moveStrategy?.generateAllMoves(fromSquare))! {
    //
    //                    if player.movePiece(Move(fromSquare: fromSquare, toSquare: toSquare), checkCurrentTurn: false) {
    //
    //                        var localAlpha = alpha
    //
    //                        let evaluationValue = -alphaBeta(depth - 1, player: player.opponent!, alpha: -beta, beta: -localAlpha)
    //
    //
    //                        Board.sharedInstance.undoMove()
    //
    //
    //                        if evaluationValue > bestEvaluationValue {
    //
    //                            bestEvaluationValue = evaluationValue
    //                        }
    //
    //                        if bestEvaluationValue >= beta {
    //
    //                            break
    //
    //                        } else if bestEvaluationValue > alpha {
    //
    //                            localAlpha = bestEvaluationValue
    //                        }
    //                    }
    //                }
    //            }
    //        }
    //
    //        return bestEvaluationValue
    //    }
}
