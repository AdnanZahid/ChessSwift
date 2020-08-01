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

enum CaptureStrategy {
    case diagonal
    case straight
    case lShaped
}

enum MovementType {
    case step
    case slide
    case hop
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
    captureStrategies: [CaptureStrategy],
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
            
        case .whiteBishop: return PieceTuple(value: Constants.Values.bishop,
                                             movementStrategies: [.diagonal],
                                             captureStrategies: [.diagonal],
                                             movementType: .slide,
                                             movementDirection: .any,
                                             color: .white,
                                             symbol: "b")
            
        case .whiteKing: return PieceTuple(value: Constants.Values.king,
                                           movementStrategies: [.diagonal, .straight],
                                           captureStrategies: [.diagonal, .straight],
                                           movementType: .step,
                                           movementDirection: .any,
                                           color: .white,
                                           symbol: "k")
            
        case .whiteKnight: return PieceTuple(value: Constants.Values.knight,
                                             movementStrategies: [.lShaped],
                                             captureStrategies: [.lShaped],
                                             movementType: .hop,
                                             movementDirection: .any,
                                             color: .white,
                                             symbol: "n")
            
        case .whitePawn: return PieceTuple(value: Constants.Values.pawn,
                                           movementStrategies: [.straight],
                                           captureStrategies: [.diagonal],
                                           movementType: .step,
                                           movementDirection: .forward,
                                           color: .white,
                                           symbol: "p")
            
        case .whiteQueen: return PieceTuple(value: Constants.Values.queen,
                                            movementStrategies: [.diagonal, .straight],
                                            captureStrategies: [.diagonal, .straight],
                                            movementType: .slide,
                                            movementDirection: .any,
                                            color: .white,
                                            symbol: "q")
            
        case .whiteRook: return PieceTuple(value: Constants.Values.rook,
                                           movementStrategies: [.straight],
                                           captureStrategies: [.straight],
                                           movementType: .slide,
                                           movementDirection: .any,
                                           color: .white,
                                           symbol: "r")
            
            // Black
            
        case .blackBishop: return PieceTuple(value: Constants.Values.bishop,
                                             movementStrategies: [.diagonal],
                                             captureStrategies: [.diagonal],
                                             movementType: .slide,
                                             movementDirection: .any,
                                             color: .black,
                                             symbol: "B")
            
        case .blackKing: return PieceTuple(value: Constants.Values.king,
                                           movementStrategies: [.diagonal, .straight],
                                           captureStrategies: [.diagonal, .straight],
                                           movementType: .step,
                                           movementDirection: .any,
                                           color: .black,
                                           symbol: "K")
            
        case .blackKnight: return PieceTuple(value: Constants.Values.knight,
                                             movementStrategies: [.lShaped],
                                             captureStrategies: [.lShaped],
                                             movementType: .hop,
                                             movementDirection: .any,
                                             color: .black,
                                             symbol: "N")
            
        case .blackPawn: return PieceTuple(value: Constants.Values.pawn,
                                           movementStrategies: [.straight],
                                           captureStrategies: [.diagonal],
                                           movementType: .step,
                                           movementDirection: .forward,
                                           color: .black,
                                           symbol: "P")
            
        case .blackQueen: return PieceTuple(value: Constants.Values.queen,
                                            movementStrategies: [.diagonal, .straight],
                                            captureStrategies: [.diagonal, .straight],
                                            movementType: .slide,
                                            movementDirection: .any,
                                            color: .black,
                                            symbol: "Q")
            
        case .blackRook: return PieceTuple(value: Constants.Values.rook,
                                           movementStrategies: [.straight],
                                           captureStrategies: [.straight],
                                           movementType: .slide,
                                           movementDirection: .any,
                                           color: .black,
                                           symbol: "R")
        }
    }
    
    init?(rawValue: (value: Int,
        movementStrategies: [MovementStrategy],
        captureStrategies: [CaptureStrategy],
        movementType: MovementType,
        movementDirection: MovementDirection,
        color: Color,
        symbol: String)) {
        return nil
    }
}
