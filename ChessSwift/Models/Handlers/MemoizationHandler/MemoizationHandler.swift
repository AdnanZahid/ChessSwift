//
//  MemoizationHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 24/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class MemoizationHandler {
}

extension MemoizationHandler {
    
    class MemoizedMovementDirectionHandler {
        static let isValid = memoize { (tripletState: TripletState) in MovementDirectionHandler.isValid(move: tripletState.first,
                                                                                                        movementDirection: tripletState.second,
                                                                                                        color: tripletState.third) }
    }
    
    class MemoizedMovementStrategyHandler {
        static let isValid = memoize { (pairState: PairState) in MovementStrategyHandler.isValid(move: pairState.first, movementStrategies: pairState.second) }
    }
    
    class MemoizedMovementTypeHandler {
        static let isValid = memoize { (tripletState: TripletState) in MovementTypeHandler.isValid(move: tripletState.first,
                                                                                                   movementTypes: tripletState.second,
                                                                                                   boardState: tripletState.third) }
    }
    
    class MemoizedBestMoveHandler {
        static let bestMove = memoize(function: BestMoveHandler.bestMove)
        static let bestValue = memoize { (quadrupletState: QuadrupletState) in BestMoveHandler.bestEvaluationValue(at: quadrupletState.first,
                                                                                                                   gameState: quadrupletState.second,
                                                                                                                   alpha: quadrupletState.third,
                                                                                                                   beta: quadrupletState.fourth) }
    }
    
    class MemoizedBoardHandler {
        static let move = memoize { (pairState: PairState) in BoardHandler.move(pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedEvaluationValueHandler {
        static let getValue = memoize(function: EvaluationValueHandler.getValue)
        static let pieceValueSum = memoize(function: EvaluationValueHandler.pieceValueSum)
        static let mobilityValueSum = memoize { (pairState: PairState) in EvaluationValueHandler.mobilityValueSum(squares: pairState.first,
                                                                                                                  boardState: pairState.second) }
    }
    
    class MemoizedGameHandler {
        static let move = memoize { (pairState: PairState) in GameHandler.move(pairState.first, gameState: pairState.second) }
    }
    
    class MemoizedLegalMovesHandler {
        static let move = memoize { (pairState: PairState) in LegalMovesHandler.move(pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedMoveGenerationHandler {
        static let getBoardStateMoves = memoize { (pairState: PairState) in MoveGenerationHandler.getMoves(forPieceOn: pairState.first, boardState: pairState.second) }
        static let getGameStateMoves = memoize(function: MoveGenerationHandler.getMoves)
        static let currentPlayerMoves = memoize { (pairState: PairState) in MoveGenerationHandler.currentPlayerMoves(squares: pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedPiecesHandler {
        static let piecesMovable = memoize(function: PiecesHandler.piecesMovable)
    }
}

extension MemoizationHandler {
    
    private static func memoize<T: Hashable, U>(function: @escaping (T) -> U) ->  (T) -> U {
        var cache: [T: U] = [:]
        func memoizationWrapper(input: T) -> U {
            if let cacheValue = cache[input] {
                return cacheValue
            }
            let newValue = function(input)
            cache[input] = newValue
            return newValue
        }
        return memoizationWrapper
    }
}
