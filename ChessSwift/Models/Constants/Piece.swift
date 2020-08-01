//
//  Piece.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 30/07/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

enum MovementStrategy {
    case diagonal
    case straight
    case lShaped
}

enum MovementType {
    case step
    case slide
}

enum MovementDirection {
    case forward
    case any
}

enum Color {
    case white
    case black
}

typealias PieceTuple = (value: Int,
    movementStrategies: [MovementStrategy],
    movementType: MovementType,
    movementDirection: MovementDirection,
    color: Color,
    symbol: String)

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
        switch self {
            
            // White
            
        case .whiteBishop: return PieceTuple(value: 350,
                                             movementStrategies: [.diagonal],
                                             movementType: .slide,
                                             movementDirection: .any,
                                             color: .white,
                                             symbol: "b")
            
        case .whiteKing: return PieceTuple(value: .max,
                                           movementStrategies: [.diagonal, .straight],
                                           movementType: .step,
                                           movementDirection: .any,
                                           color: .white,
                                           symbol: "k")
            
        case .whiteKnight: return PieceTuple(value: 300,
                                             movementStrategies: [.lShaped],
                                             movementType: .step,
                                             movementDirection: .any,
                                             color: .white,
                                             symbol: "n")
            
        case .whitePawn: return PieceTuple(value: 100,
                                           movementStrategies: [.straight],
                                           movementType: .step,
                                           movementDirection: .forward,
                                           color: .white,
                                           symbol: "p")
            
        case .whiteQueen: return PieceTuple(value: 900,
                                            movementStrategies: [.diagonal, .straight],
                                            movementType: .slide,
                                            movementDirection: .any,
                                            color: .white,
                                            symbol: "q")
            
        case .whiteRook: return PieceTuple(value: 500,
                                           movementStrategies: [.straight],
                                           movementType: .slide,
                                           movementDirection: .any,
                                           color: .white,
                                           symbol: "r")
            
            // Black
            
        case .blackBishop: return PieceTuple(value: -350,
                                             movementStrategies: [.diagonal],
                                             movementType: .slide,
                                             movementDirection: .any,
                                             color: .black,
                                             symbol: "B")
            
        case .blackKing: return PieceTuple(value: -.max,
                                           movementStrategies: [.diagonal, .straight],
                                           movementType: .step,
                                           movementDirection: .any,
                                           color: .black,
                                           symbol: "K")
            
        case .blackKnight: return PieceTuple(value: -300,
                                             movementStrategies: [.lShaped],
                                             movementType: .step,
                                             movementDirection: .any,
                                             color: .black,
                                             symbol: "N")
            
        case .blackPawn: return PieceTuple(value: -100,
                                           movementStrategies: [.straight],
                                           movementType: .step,
                                           movementDirection: .forward,
                                           color: .black,
                                           symbol: "P")
            
        case .blackQueen: return PieceTuple(value: -900,
                                            movementStrategies: [.diagonal, .straight],
                                            movementType: .slide,
                                            movementDirection: .any,
                                            color: .black,
                                            symbol: "Q")
            
        case .blackRook: return PieceTuple(value: -500,
                                           movementStrategies: [.straight],
                                           movementType: .slide,
                                           movementDirection: .any,
                                           color: .black,
                                           symbol: "R")
        }
    }
    
    init?(rawValue: (value: Int,
        movementStrategies: [MovementStrategy],
        movementType: MovementType,
        movementDirection: MovementDirection,
        color: Color,
        symbol: String)) {
        return nil
    }
}
