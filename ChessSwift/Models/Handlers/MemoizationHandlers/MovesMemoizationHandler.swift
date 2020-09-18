//
//  MovesMemoizationHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 18/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class MovesMemoizationHandler {
    
    static var dictionary: [String: [MoveState]]  = [:]
    
    static func setMoves(_ moveStates: [MoveState], forSquareState squareState: SquareState, forKey key: String) {
        guard let piece = squareState.piece else { return }
        dictionary["\(key)\(squareState.debugDescription)\(piece.rawValue.symbol)"] = moveStates
    }
    
    static func getMoves(forSquareState squareState: SquareState, forKey key: String) -> [MoveState]? {
        guard let piece = squareState.piece else { return nil }
        return dictionary["\(key)\(squareState.debugDescription)\(piece.rawValue.symbol)"]
    }
}
