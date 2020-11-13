//
//  EligibleForPromotion.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 11/11/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

enum EligibleForPromotion {
    case yes(rankIndex: RankIndex, promotionOptions: [Piece])
    case no
}
