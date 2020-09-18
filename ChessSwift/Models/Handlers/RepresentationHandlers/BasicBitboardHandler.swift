//
//  BasicBitboardHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 18/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class BasicBitboardHandler {
    
    static var bitboardString = ""
    
    static func representation(of boardState: BoardState) -> String {
        var string = ""
        // Was reversed earlier in the Constants.swift file for viewing convenience
        // Reversing a reverse will give us the accurate view
        Array(RankIndex._1.rawValue...RankIndex._8.rawValue).forEach { rank in
            Array(FileIndex._A.rawValue...FileIndex._H.rawValue).forEach { file in
                if let piece = boardState.squares[rank][file]?.piece {
                    string.append(piece.rawValue.color == .white ? "1" : "-1")
                } else {
                    string.append("0")
                }
            }
        }
        return string
    }
}
