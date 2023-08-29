//
//  MovementDirectionHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 02/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol MovementDirectionHandlerProtocol {
    
    func isValid(move: MoveState, movementDirection: MovementDirection, color: Color) -> Bool

}

class MovementDirectionHandler {
}

extension MovementDirectionHandler: MovementDirectionHandlerProtocol {
    
    func isValid(move: MoveState, movementDirection: MovementDirection, color: Color) -> Bool {
        switch movementDirection {
        case .forward:
            switch color {
            case .white:
                return isRankIncremented(for: move)
            case .black:
                return isRankDecremented(for: move)
            }
        case .any:
            return true
        }
    }
    
    private func isRankIncremented(for move: MoveState) -> Bool {
        move.fromSquare.rankIndex.rawValue < move.toSquare.rankIndex.rawValue
    }
    
    private func isRankDecremented(for move: MoveState) -> Bool {
        move.fromSquare.rankIndex.rawValue > move.toSquare.rankIndex.rawValue
    }
}
