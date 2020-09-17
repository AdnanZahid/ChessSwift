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
        UserDefaults.standard.set(try? JSONEncoder().encode(moveStates), forKey: "\(key)\(squareState.debugDescription)")
    }
    
    static func getMoves(forSquareState squareState: SquareState, forKey key: String) -> [MoveState]? {
        guard let data = UserDefaults.standard.value(forKey: "\(key)\(squareState.debugDescription)") as? Data else { return nil }
        return try? JSONDecoder().decode([MoveState].self, from: data)
    }
}
