//
//  Piece.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

enum Piece: RawRepresentable {
    
    case whiteBishop
    case whiteKing
    case whiteKnight
    case whitePawn
    case whiteQueen
    case whiteRook
    
    case blackBishop
    case blackKing
    case blackKnight
    case blackPawn
    case blackQueen
    case blackRook
    
    var rawValue: PieceTuple {
        getPieceTuple(for: self)
    }
    
    init?(rawValue: PieceTuple) {
        nil
    }
    
    func getPieceTuple(for piece: Piece) -> PieceTuple {
        switch piece {
        // White
        case .whiteBishop: return PieceTuples.whiteBishop
        case .whiteKing: return PieceTuples.whiteKing
        case .whiteKnight: return PieceTuples.whiteKnight
        case .whitePawn: return PieceTuples.whitePawn
        case .whiteQueen: return PieceTuples.whiteQueen
        case .whiteRook: return PieceTuples.whiteRook
        // Black
        case .blackBishop: return PieceTuples.blackBishop
        case .blackKing: return PieceTuples.blackKing
        case .blackKnight: return PieceTuples.blackKnight
        case .blackPawn: return PieceTuples.blackPawn
        case .blackQueen: return PieceTuples.blackQueen
        case .blackRook: return PieceTuples.blackRook
        }
    }
}
