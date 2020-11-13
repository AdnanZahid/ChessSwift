//
//  BoardState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct BoardState {
    
    private enum Constants {
        static let newLine = "\n"
    }
    
    let squares: [[SquareState?]]
}

extension BoardState: Hashable {
    
    var hashValue: Int {
        squares.flatMap { $0 }.map { $0?.piece?.rawValue.symbol ?? "1" }.joined().squeezed.hashValue
    }
}

extension BoardState: CustomDebugStringConvertible {
    var debugDescription: String {
        var string = ""
        // Was reversed earlier in the Constants.swift file for viewing convenience
        // Reversing a reverse will give us the accurate view
        Array(RankIndex._1.rawValue...RankIndex._8.rawValue).reversed().forEach { rank in
            Array(FileIndex._A.rawValue...FileIndex._H.rawValue).forEach { file in
                if let piece = squares[rank][file]?.piece {
                    string.append(piece.rawValue.symbol + " ")
                } else {
                    string.append("x" + " ")
                }
            }
            string.append(Constants.newLine)
        }
        return string
    }
}
