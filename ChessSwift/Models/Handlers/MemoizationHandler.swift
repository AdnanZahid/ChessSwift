//
//  MemoizationHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 24/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class MemoizationHandler {
    
    class MemoizedBoardHandler {
        let move = memoize { (pairState: PairState) in BoardHandler.move(pairState.first, boardState: pairState.second) }
    }
    
    class MemoizedEvaluationValueHandler {
        let getValue = memoize { (pairState: PairState) in EvaluationValueHandler.getValue(for: pairState.first, player: pairState.second) }
    }
}

extension MemoizationHandler {
    
    private static func memoize<T: Hashable, U>(function: @escaping (T) -> U) ->  (T) -> U {
        var cache : [T: U] = [:]
        func memoWrapper(input: T) -> U {
            if let cacheValue = cache[input] {
                return cacheValue
            }
            let newVal = function(input)
            cache[input] = newVal
            return newVal
        }
        return memoWrapper
    }
}
