//
//  MovementType.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 11/11/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

enum MovementType: Hashable {
    case step
    case slide
    case slideFrom(fileIndex: FileIndex? = nil, rankIndex: RankIndex? = nil, forNumberOfFiles: Int = 0, forNumberOfRanks: Int = 0)
    case hop
}
