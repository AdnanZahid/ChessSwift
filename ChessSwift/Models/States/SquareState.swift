//
//  SquareState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct SquareState {
    let fileIndex: FileIndex
    let rankIndex: RankIndex
    var piece: Piece?
}

extension SquareState: Hashable {
    
    var hashValue: Int {
        (rankIndex.rawValue * 8) + fileIndex.rawValue
    }
}

extension SquareState: CustomDebugStringConvertible {
    var debugDescription: String {
        "\(fileIndex)\(rankIndex)"
    }
}

extension SquareState: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.fileIndex == rhs.fileIndex && lhs.rankIndex == rhs.rankIndex
    }
    
    static func + (square: SquareState, advancement: AdvancementState) -> SquareState? {
        guard let file = square.fileIndex + advancement.fileAdvancement, let rank = square.rankIndex + advancement.rankAdvancement else { return nil }
        return SquareState(fileIndex: file, rankIndex: rank)
    }
    
    static func - (square: SquareState, advancement: AdvancementState) -> SquareState? {
        square + (AdvancementState(fileAdvancement: advancement.fileAdvancement, rankAdvancement: advancement.rankAdvancement) * -1)
    }
}
