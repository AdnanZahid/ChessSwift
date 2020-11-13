//
//  PieceTuple.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 11/11/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct PieceTuple {
    let value: Int
    let movementStrategies: [MovementStrategy]
    let captureStrategies: [MovementStrategy]
    let movementTypes: [MovementType]
    let movementDirection: MovementDirection
    let allowedToBeCaptured: Bool
    let eligibleForPromotion: EligibleForPromotion
    let color: Color
    let symbol: String
}

enum PieceTuples {
    
    private enum PieceConstants {
        static let kingCastlingSteps = 2
        static let pawnFirstMoveSteps = 2
    }
    
    // White
    
    static let whiteBishop = PieceTuple(value: Constants.Values.whiteBishop,
                                        movementStrategies: [.diagonal],
                                        captureStrategies: [.diagonal],
                                        movementTypes: [.slide],
                                        movementDirection: .any,
                                        allowedToBeCaptured: true,
                                        eligibleForPromotion: .no,
                                        color: .white,
                                        symbol: "b")
    
    static let whiteKing = PieceTuple(value: Constants.Values.whiteKing,
                                      movementStrategies: [.diagonal, .straight],
                                      captureStrategies: [.diagonal, .straight],
                                      movementTypes: [.step,
                                                      .slideFrom(fileIndex: ._A, forNumberOfFiles: PieceConstants.kingCastlingSteps)],
                                      movementDirection: .any,
                                      allowedToBeCaptured: false,
                                      eligibleForPromotion: .no,
                                      color: .white,
                                      symbol: "k")
    
    static let whiteKnight = PieceTuple(value: Constants.Values.whiteKnight,
                                        movementStrategies: [.lShaped],
                                        captureStrategies: [.lShaped],
                                        movementTypes: [.hop],
                                        movementDirection: .any,
                                        allowedToBeCaptured: true,
                                        eligibleForPromotion: .no,
                                        color: .white,
                                        symbol: "n")
    
    static let whitePawn = PieceTuple(value: Constants.Values.whitePawn,
                                      movementStrategies: [.straight],
                                      captureStrategies: [.diagonal],
                                      movementTypes: [.step,
                                                      .slideFrom(rankIndex: ._2, forNumberOfRanks: PieceConstants.pawnFirstMoveSteps)],
                                      movementDirection: .forward,
                                      allowedToBeCaptured: true,
                                      eligibleForPromotion: .yes(rankIndex: ._8, promotionOptions: [.whiteKnight, .whiteBishop, .whiteRook, .whiteQueen]),
                                      color: .white,
                                      symbol: "p")
    
    static let whiteQueen = PieceTuple(value: Constants.Values.whiteQueen,
                                       movementStrategies: [.diagonal, .straight],
                                       captureStrategies: [.diagonal, .straight],
                                       movementTypes: [.slide],
                                       movementDirection: .any,
                                       allowedToBeCaptured: true,
                                       eligibleForPromotion: .no,
                                       color: .white,
                                       symbol: "q")
    
    static let whiteRook = PieceTuple(value: Constants.Values.whiteRook,
                                      movementStrategies: [.straight],
                                      captureStrategies: [.straight],
                                      movementTypes: [.slide],
                                      movementDirection: .any,
                                      allowedToBeCaptured: true,
                                      eligibleForPromotion: .no,
                                      color: .white,
                                      symbol: "r")
    
    // Black
    
    static let blackBishop = PieceTuple(value: Constants.Values.blackBishop,
                                        movementStrategies: [.diagonal],
                                        captureStrategies: [.diagonal],
                                        movementTypes: [.slide],
                                        movementDirection: .any,
                                        allowedToBeCaptured: true,
                                        eligibleForPromotion: .no,
                                        color: .black,
                                        symbol: "B")
    
    static let blackKing = PieceTuple(value: Constants.Values.blackKing,
                                      movementStrategies: [.diagonal, .straight],
                                      captureStrategies: [.diagonal, .straight],
                                      movementTypes: [.step,
                                                      .slideFrom(fileIndex: ._H, forNumberOfFiles: PieceConstants.kingCastlingSteps)],
                                      movementDirection: .any,
                                      allowedToBeCaptured: false,
                                      eligibleForPromotion: .no,
                                      color: .black,
                                      symbol: "K")
    
    static let blackKnight = PieceTuple(value: Constants.Values.blackKnight,
                                        movementStrategies: [.lShaped],
                                        captureStrategies: [.lShaped],
                                        movementTypes: [.hop],
                                        movementDirection: .any,
                                        allowedToBeCaptured: true,
                                        eligibleForPromotion: .no,
                                        color: .black,
                                        symbol: "N")
    
    static let blackPawn = PieceTuple(value: Constants.Values.blackPawn,
                                      movementStrategies: [.straight],
                                      captureStrategies: [.diagonal],
                                      movementTypes: [.step,
                                                      .slideFrom(rankIndex: ._7, forNumberOfRanks: PieceConstants.pawnFirstMoveSteps)],
                                      movementDirection: .forward,
                                      allowedToBeCaptured: true,
                                      eligibleForPromotion: .yes(rankIndex: ._1, promotionOptions: [.blackKnight, .blackBishop, .blackRook, .blackQueen]),
                                      color: .black,
                                      symbol: "P")
    
    static let blackQueen = PieceTuple(value: Constants.Values.blackQueen,
                                       movementStrategies: [.diagonal, .straight],
                                       captureStrategies: [.diagonal, .straight],
                                       movementTypes: [.slide],
                                       movementDirection: .any,
                                       allowedToBeCaptured: true,
                                       eligibleForPromotion: .no,
                                       color: .black,
                                       symbol: "Q")
    
    static let blackRook = PieceTuple(value: Constants.Values.blackRook,
                                      movementStrategies: [.straight],
                                      captureStrategies: [.straight],
                                      movementTypes: [.slide],
                                      movementDirection: .any,
                                      allowedToBeCaptured: true,
                                      eligibleForPromotion: .no,
                                      color: .black,
                                      symbol: "R")
}
