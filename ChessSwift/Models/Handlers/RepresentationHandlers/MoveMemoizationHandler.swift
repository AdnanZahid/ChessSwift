//
//  MoveMemoizationHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 18/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class MoveMemoizationHandler {
    
    static func setMoves(_ moveStates: [MoveState], forSquareState squareState: SquareState, forKey key: String) {
        let archivedSquareState = try? NSKeyedArchiver.archivedData(withRootObject: squareState, requiringSecureCoding: false)
        let archivedMoveStates = moveStates.map { try? NSKeyedArchiver.archivedData(withRootObject: $0, requiringSecureCoding: false) }
        UserDefaults.standard.set([archivedSquareState: archivedMoveStates], forKey: key)
    }
    
    static func getMoves(forSquareState squareState: SquareState, forKey key: String) -> [MoveState]? {
        guard let dictionary = UserDefaults.standard.value(forKey: key) as? [SquareState: [MoveState]] else { return nil }
        return dictionary[squareState]
    }
}
