//
//  PieceFactory.swift
//  Chess
//
//  Created by Adnan Zahid on 8/9/16.
//  Copyright © 2016 Chess. All rights reserved.
//

class PieceFactory {
    
    static func getPiece(_ value: Int) -> Piece? {
        
        switch value {
            
        case Constants.Values.whiteKing:
            return .whiteKing
        case Constants.Values.whiteQueen:
            return .whiteQueen
        case Constants.Values.whiteRook:
            return .whiteRook
        case Constants.Values.whiteKnight:
            return .whiteKnight
        case Constants.Values.whiteBishop:
            return .whiteBishop
        case Constants.Values.whitePawn:
            return .whitePawn
            
        case Constants.Values.blackKing:
            return .blackKing
        case Constants.Values.blackQueen:
            return .blackQueen
        case Constants.Values.blackRook:
            return .blackRook
        case Constants.Values.blackKnight:
            return .blackKnight
        case Constants.Values.blackBishop:
            return .blackBishop
        case Constants.Values.blackPawn:
            return .blackPawn
            
        default:
            return nil
        }
    }
}
