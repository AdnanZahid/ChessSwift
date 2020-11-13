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
        // White
        static let whitePawn   = 100
        static let whiteKnight = 300
        static let whiteBishop = 305
        static let whiteRook   = 500
        static let whiteQueen  = 900
        static let whiteKing   = 2000
        // Black
        static let blackPawn   = -100
        static let blackKnight = -300
        static let blackBishop = -305
        static let blackRook   = -500
        static let blackQueen  = -900
        static let blackKing   = -2000
    }
    
    // White
    private static let x = Constants.Values.empty
    private static let p = Constants.Values.whitePawn
    private static let n = Constants.Values.whiteKnight
    private static let b = Constants.Values.whiteBishop
    private static let r = Constants.Values.whiteRook
    private static let q = Constants.Values.whiteQueen
    private static let k = Constants.Values.whiteKing
    // Black
    private static let P = Constants.Values.blackPawn
    private static let N = Constants.Values.blackKnight
    private static let B = Constants.Values.blackBishop
    private static let R = Constants.Values.blackRook
    private static let Q = Constants.Values.blackQueen
    private static let K = Constants.Values.blackKing
    
    enum ChessBoardConfiguration {
        
        typealias ConfigurationType = [[Int]]
        
        static let standard: [[Int]] = [
            
            [R, N, B, Q, K, B, N, R],
            [P, P, P, P, P, P, P, P],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [x, x, x, x, x, x, x, x],
            [p, p, p, p, p, p, p, p],
            [r, n, b, q, k, b, n, r],
            ].reversed() // Reversing for viewing convenience
        
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
