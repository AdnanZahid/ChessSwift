//
//  AdvancementState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 01/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct AdvancementState {
    let fileAdvancement: Int
    let rankAdvancement: Int
}

extension AdvancementState: Hashable {
    
    var hashValue: Int {
        (rankAdvancement * 8) + fileAdvancement
    }
}

extension AdvancementState: Codable {
    
    private enum CodingKeys: CodingKey {
        case fileAdvancement, rankAdvancement
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fileAdvancement, forKey: .fileAdvancement)
        try container.encode(rankAdvancement, forKey: .rankAdvancement)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fileAdvancement = try container.decode(Int.self, forKey: .fileAdvancement)
        rankAdvancement = try container.decode(Int.self, forKey: .rankAdvancement)
    }
}

extension AdvancementState: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.fileAdvancement == rhs.fileAdvancement && lhs.rankAdvancement == rhs.rankAdvancement
    }
    
    static func * (advancement: AdvancementState, multiplier: Int) -> AdvancementState {
        AdvancementState(fileAdvancement: advancement.fileAdvancement * multiplier, rankAdvancement: advancement.rankAdvancement * multiplier)
    }
}
