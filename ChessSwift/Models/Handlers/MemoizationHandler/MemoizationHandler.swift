//
//  MemoizationHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 24/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class MemoizationHandler {
    
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
    
    class MemoizedBoardHandler {
        static let move = memoize { (pairState: PairState) in BoardHandler.move(pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedEvaluationValueHandler {
        static let getValue = memoize { (pairState: PairState) in EvaluationValueHandler.getValue(for: pairState.first, player: pairState.second) }
    }
    
    class MemoizedGameHandler {
        static let isAITurn = memoize(function: GameHandler.isAITurn)
        static let move = memoize { (pairState: PairState) in GameHandler.move(pairState.first, gameState: pairState.second) }
    }
    
    class MemoizedLegalMovesHandler {
        static let move = memoize { (pairState: PairState) in LegalMovesHandler.move(pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedMoveGenerationHandler {
        static let getMoves = memoize { (pairState: PairState) in MoveGenerationHandler.getMoves(forPieceOn: pairState.first, boardState: pairState.second) }
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
