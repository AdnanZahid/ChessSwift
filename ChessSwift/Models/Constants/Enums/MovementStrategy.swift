//
//  MovementStrategy.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 11/11/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

enum MovementStrategy: RawRepresentable {
    case diagonal
    case straight
    case lShaped
    
    var rawValue: [AdvancementState] {
        switch self {
        case .diagonal:
            return [AdvancementState(fileAdvancement: 1, rankAdvancement: 1),
                    AdvancementState(fileAdvancement: 1, rankAdvancement: -1),
                    AdvancementState(fileAdvancement: -1, rankAdvancement: 1),
                    AdvancementState(fileAdvancement: -1, rankAdvancement: -1)]
        case .straight:
            return [AdvancementState(fileAdvancement: 1, rankAdvancement: 0),
                    AdvancementState(fileAdvancement: 0, rankAdvancement: 1),
                    AdvancementState(fileAdvancement: -1, rankAdvancement: 0),
                    AdvancementState(fileAdvancement: 0, rankAdvancement: -1)]
        case .lShaped:
            return [AdvancementState(fileAdvancement: 1, rankAdvancement: 2),
                    AdvancementState(fileAdvancement: 2, rankAdvancement: 1),
                    AdvancementState(fileAdvancement: -1, rankAdvancement: 2),
                    AdvancementState(fileAdvancement: -2, rankAdvancement: 1),
                    AdvancementState(fileAdvancement: 1, rankAdvancement: -2),
                    AdvancementState(fileAdvancement: 2, rankAdvancement: -1),
                    AdvancementState(fileAdvancement: -1, rankAdvancement: -2),
                    AdvancementState(fileAdvancement: -2, rankAdvancement: -1)]
        }
    }
    
    init?(rawValue: [AdvancementState]) {
        nil
    }
}
