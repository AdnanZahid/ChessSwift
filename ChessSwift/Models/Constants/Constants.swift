//
//  Constants.swxft
//  ChessSwift
//
//  Created by Adnan Zahid on 31/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

enum Constants {
    
    static let ranks = 8
    static let files = 8
    
    enum Values {
        static let empty  = 0
        static let pawn   = 100
        static let knight = 300
        static let bishop = 305
        static let rook   = 500
        static let queen  = 900
        static let king   = 2000
    }
    
    private static let x = Constants.Values.empty
    private static let P = Constants.Values.pawn
    private static let N = Constants.Values.knight
    private static let B = Constants.Values.bishop
    private static let R = Constants.Values.rook
    private static let Q = Constants.Values.queen
    private static let K = Constants.Values.king
    
    private static let p = -P
    private static let n = -N
    private static let b = -B
    private static let r = -R
    private static let q = -Q
    private static let k = -K
    
    enum ChessBoardConfiguration {
        
        typealias ConfigurationType = [[Int]]
        
        static let standard: [[Int]] = [
            
            [r, n, b, q, k, b, n, r],
            [p, p, p, p, p, p, p, p],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [P, P, P, P, P, P, P, P],
            [R, N, B, Q, K, B, N, R]
        ]
        
        static let empty: [[Int]] = [
            
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
        ]
    }
}
