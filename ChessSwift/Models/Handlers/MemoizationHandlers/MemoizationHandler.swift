//
//  MemoizationHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 27.02.22.
//  Copyright © 2022 Adnan Zahid. All rights reserved.
//

import Foundation

struct MemoizationHandler {
}

extension MemoizationHandler {

    class MovementDirectionHandler {
        static let isValid = memoize { (tripletState: TripletState) in MovementDirectionHandler.isValid(move: tripletState.first,
                                                                                                        movementDirection: tripletState.second,
                                                                                                        color: tripletState.third) }
    }

    class MovementStrategyHandler {
        static let isValid = memoize { (pairState: PairState) in MovementStrategyHandler.isValid(move: pairState.first, movementStrategies: pairState.second) }
    }

    class MovementTypeHandler {
        static let isValid = memoize { (tripletState: TripletState) in MovementTypeHandler.isValid(move: tripletState.first,
                                                                                                   movementTypes: tripletState.second,
                                                                                                   boardState: tripletState.third) }
    }

    class BestMoveHandler {
        static let bestMove = memoize(function: BestMoveHandler.bestMove)
    }

    class BoardHandler {
        static let move = memoize { (pairState: PairState) in BoardHandler.move(pairState.first, boardState: pairState.second) }
    }

    class EvaluationValueHandler {
        static let getValue = memoize { (pairState: PairState) in EvaluationValueHandler.getValue(for: pairState.first, player: pairState.second) }
    }

    class GameHandler {
        static let move = memoize { (pairState: PairState) in GameHandler.move(pairState.first, gameState: pairState.second) }
    }

    class LegalMovesHandler {
        static let move = memoize { (pairState: PairState) in LegalMovesHandler.move(pairState.first, boardState: pairState.second) }
    }

    class MoveGenerationHandler {
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
