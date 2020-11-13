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
        static let isValid = memoize(shouldUseCache: false) { (tripletState: TripletState) in MovementDirectionHandler.isValid(move: tripletState.first,
                                                                                                                               movementDirection: tripletState.second,
                                                                                                                               color: tripletState.third) }
    }
    
    class MemoizedMovementStrategyHandler {
        static let isValid = memoize(shouldUseCache: false) { (pairState: PairState) in MovementStrategyHandler.isValid(move: pairState.first, movementStrategies: pairState.second) }
    }
    
    class MemoizedMovementTypeHandler {
        static let isValid = memoize(shouldUseCache: false) { (tripletState: TripletState) in MovementTypeHandler.isValid(move: tripletState.first,
                                                                                                                          movementTypes: tripletState.second,
                                                                                                                          boardState: tripletState.third) }
    }
    
    class MemoizedBestMoveHandler {
        static let bestMove = memoize(shouldUseCache: false, function: BestMoveHandler.bestMove)
        static let bestValue = memoize(shouldUseCache: false) { (quadrupletState: QuadrupletState) in BestMoveHandler.bestEvaluationValue(at: quadrupletState.first,
                                                                                                                                          gameState: quadrupletState.second,
                                                                                                                                          alpha: quadrupletState.third,
                                                                                                                                          beta: quadrupletState.fourth) }
    }
    
    class MemoizedBoardHandler {
        static let move = memoize(shouldUseCache: false) { (pairState: PairState) in BoardHandler.move(pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedEvaluationValueHandler {
        static let getValue = memoize(shouldUseCache: false,
                                      function: EvaluationValueHandler.getValue)
        static let pieceValueSum = memoize(shouldUseCache: false,
                                           function: EvaluationValueHandler.pieceValueSum)
        static let mobilityValueSum = memoize(shouldUseCache: false) { (pairState: PairState) in EvaluationValueHandler.mobilityValueSum(squares: pairState.first,
                                                                                                                                         boardState: pairState.second) }
    }
    
    class MemoizedGameHandler {
        static let move = memoize(shouldUseCache: false) { (pairState: PairState) in GameHandler.move(pairState.first, gameState: pairState.second) }
    }
    
    class MemoizedLegalMovesHandler {
        static let move = memoize(shouldUseCache: false) { (pairState: PairState) in LegalMovesHandler.move(pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedMoveGenerationHandler {
        static let getBoardStateMoves = memoize(shouldUseCache: false) { (pairState: PairState) in MoveGenerationHandler.getMoves(forPieceOn: pairState.first, boardState: pairState.second) }
        static let getGameStateMoves = memoize(shouldUseCache: false,
                                               function: MoveGenerationHandler.getMoves)
        static let currentPlayerMoves = memoize(shouldUseCache: false) { (pairState: PairState) in MoveGenerationHandler.currentPlayerMoves(squares: pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedPiecesHandler {
        static let allPieces = memoize(shouldUseCache: false,
                                       function: PiecesHandler.allPieces)
        static let movablePieces = memoize(shouldUseCache: false,
                                           function: PiecesHandler.movablePieces)
    }
}

extension MemoizationHandler {
    
    private static func memoize<T: Hashable, U>(shouldUseCache: Bool,
                                                function: @escaping (T) -> U) ->  (T) -> U {
        var cache = ConcurrentDictionary<T, U>()
        func memoizationWrapper(input: T) -> U {
            if shouldUseCache,
                let cacheValue = cache[input] {
                return cacheValue
            }
            let newValue = function(input)
            if shouldUseCache { cache[input] = newValue }
            return newValue
        }
        return memoizationWrapper
    }
}
