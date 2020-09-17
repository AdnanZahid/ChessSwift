//
//  MoveState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct MoveState {
    let fromSquare: SquareState
    let toSquare: SquareState
    var evaluationValue: Int?
}

extension MoveState: Equatable {
}

extension MoveState: Codable {
}

extension MoveState: CustomDebugStringConvertible {
    var debugDescription: String {
        "\(fromSquare)->\(toSquare)"
    }
}
