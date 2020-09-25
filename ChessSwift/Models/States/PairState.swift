//
//  PairState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 25/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct PairState<T: Hashable, U: Hashable>: Hashable {
    let first: T
    let second: U
}
