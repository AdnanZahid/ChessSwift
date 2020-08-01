//
//  SquareState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct SquareState {
    let file: FileIndex
    let rank: RankIndex
    var piece: Piece?
}

extension SquareState: Equatable {
    
    static func + (square: SquareState, advancement: AdvancementState) -> SquareState? {
        guard let file = square.file + advancement.fileAdvancement, let rank = square.rank + advancement.rankAdvancement else { return nil }
        return SquareState(file: file, rank: rank)
    }
    
    static func - (square: SquareState, advancement: AdvancementState) -> SquareState? {
        return square + AdvancementState(fileAdvancement: advancement.fileAdvancement * -1, rankAdvancement: advancement.rankAdvancement * -1)
    }
}
