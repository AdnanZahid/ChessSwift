//
//  QuadrupletState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 25/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct QuadrupletState<T: Hashable, U: Hashable, V: Hashable, W: Hashable>: Hashable {
    let first: T
    let second: U
    let third: V
    let fourth: W
}
