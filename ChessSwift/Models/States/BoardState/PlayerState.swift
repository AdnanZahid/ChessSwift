//
//  PlayerState.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

protocol PlayerStateProtocol {

    var isAI: Bool { get }
    var color: Color { get }

}

struct PlayerState {

    let isAI: Bool
    let color: Color

}

//extension PlayerState: Hashable {
//    
//    var hashValue: Int {
//        color.rawValue
//    }
//}
