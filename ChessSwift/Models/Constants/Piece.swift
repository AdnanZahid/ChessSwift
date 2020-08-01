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
    case slideFrom(fileIndex: FileIndex? = nil, rankIndex: RankIndex? = nil, forNumberOfFiles: Int = 0, forNumberOfRanks: Int = 0)
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
    movementTypes: [MovementType],
    movementDirection: MovementDirection,
    color: Color,
    symbol: String)

enum Piece: RawRepresentable {
    private enum PieceConstants {
        static let kingCastlingSteps = 2
        static let pawnFirstMoveSteps = 2
    }
    
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
                                             movementTypes: [.slide],
                                             movementDirection: .any,
                                             color: .white,
                                             symbol: "b")
            
        case .whiteKing: return PieceTuple(value: Constants.Values.king,
                                           movementStrategies: [.diagonal, .straight],
                                           captureStrategies: [.diagonal, .straight],
                                           movementTypes: [.step,
                                                           .slideFrom(fileIndex: FileIndex._A, forNumberOfFiles: PieceConstants.kingCastlingSteps),
                                                           .slideFrom(fileIndex: FileIndex._H, forNumberOfFiles: PieceConstants.kingCastlingSteps)],
                                           movementDirection: .any,
                                           color: .white,
                                           symbol: "k")
            
        case .whiteKnight: return PieceTuple(value: Constants.Values.knight,
                                             movementStrategies: [.lShaped],
                                             captureStrategies: [.lShaped],
                                             movementTypes: [.hop],
                                             movementDirection: .any,
                                             color: .white,
                                             symbol: "n")
            
        case .whitePawn: return PieceTuple(value: Constants.Values.pawn,
                                           movementStrategies: [.straight],
                                           captureStrategies: [.diagonal],
                                           movementTypes: [.step, .slideFrom(rankIndex: RankIndex._2, forNumberOfRanks: PieceConstants.pawnFirstMoveSteps)],
                                           movementDirection: .forward,
                                           color: .white,
                                           symbol: "p")
            
        case .whiteQueen: return PieceTuple(value: Constants.Values.queen,
                                            movementStrategies: [.diagonal, .straight],
                                            captureStrategies: [.diagonal, .straight],
                                            movementTypes: [.slide],
                                            movementDirection: .any,
                                            color: .white,
                                            symbol: "q")
            
        case .whiteRook: return PieceTuple(value: Constants.Values.rook,
                                           movementStrategies: [.straight],
                                           captureStrategies: [.straight],
                                           movementTypes: [.slide],
                                           movementDirection: .any,
                                           color: .white,
                                           symbol: "r")
            
            // Black
            
        case .blackBishop: return PieceTuple(value: Constants.Values.bishop,
                                             movementStrategies: [.diagonal],
                                             captureStrategies: [.diagonal],
                                             movementTypes: [.slide],
                                             movementDirection: .any,
                                             color: .black,
                                             symbol: "B")
            
        case .blackKing: return PieceTuple(value: Constants.Values.king,
                                           movementStrategies: [.diagonal, .straight],
                                           captureStrategies: [.diagonal, .straight],
                                           movementTypes: [.step,
                                                           .slideFrom(fileIndex: FileIndex._A, forNumberOfFiles: PieceConstants.kingCastlingSteps),
                                                           .slideFrom(fileIndex: FileIndex._H, forNumberOfFiles: PieceConstants.kingCastlingSteps)],
                                           movementDirection: .any,
                                           color: .black,
                                           symbol: "K")
            
        case .blackKnight: return PieceTuple(value: Constants.Values.knight,
                                             movementStrategies: [.lShaped],
                                             captureStrategies: [.lShaped],
                                             movementTypes: [.hop],
                                             movementDirection: .any,
                                             color: .black,
                                             symbol: "N")
            
        case .blackPawn: return PieceTuple(value: Constants.Values.pawn,
                                           movementStrategies: [.straight],
                                           captureStrategies: [.diagonal],
                                           movementTypes: [.step, .slideFrom(rankIndex: RankIndex._7, forNumberOfRanks: PieceConstants.pawnFirstMoveSteps)],
                                           movementDirection: .forward,
                                           color: .black,
                                           symbol: "P")
            
        case .blackQueen: return PieceTuple(value: Constants.Values.queen,
                                            movementStrategies: [.diagonal, .straight],
                                            captureStrategies: [.diagonal, .straight],
                                            movementTypes: [.slide],
                                            movementDirection: .any,
                                            color: .black,
                                            symbol: "Q")
            
        case .blackRook: return PieceTuple(value: Constants.Values.rook,
                                           movementStrategies: [.straight],
                                           captureStrategies: [.straight],
                                           movementTypes: [.slide],
                                           movementDirection: .any,
                                           color: .black,
                                           symbol: "R")
        }
    }
    
    init?(rawValue: PieceTuple) {
        return nil
    }
}
