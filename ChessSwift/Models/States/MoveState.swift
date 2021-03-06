//
//  MoveState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct MoveState: Equatable {
    let fromSquare: SquareState
    let toSquare: SquareState
}

extension MoveState: Hashable {
    
    var hashValue: Int {
        ((fromSquare.hashValue + 1) * 100) + toSquare.hashValue
    }
}

extension MoveState: CustomDebugStringConvertible {
    var debugDescription: String {
        "\(fromSquare)->\(toSquare)"
    }
}
