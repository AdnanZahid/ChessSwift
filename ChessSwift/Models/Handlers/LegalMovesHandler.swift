//
//  LegalMovesHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 01/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class LegalMovesHandler {
    enum Constants {
        static let oneStep = 1
        static let twoSteps = 2
    }
}

extension LegalMovesHandler: MoveHandler {
    
    static func move(_ move: MoveState, boardState: BoardState) -> Bool {
        guard !isZeroStepAdvanced(for: move) else { return false }
        return isValid(move: move, boardState: boardState)
    }
}

extension LegalMovesHandler {
    
    private static func isValid(move: MoveState, boardState: BoardState) -> Bool {
        let fromSquare = move.fromSquare
        let toSquare = move.toSquare
        let targetPiece = getPiece(on: toSquare, boardState: boardState)
        guard let movingPiece = getPiece(on: fromSquare, boardState: boardState),
            isPiece(movingPiece, allowedToCapture: targetPiece) else { return false }
        let moveOrCaptureStrategies = targetPiece == nil ? movingPiece.rawValue.movementStrategies : movingPiece.rawValue.captureStrategies
        let isMovementOrCaptureStrategyValid = isValid(move: move, movementStrategies: moveOrCaptureStrategies)
        let isMovementTypeValid = isValid(move: move, movementTypes: movingPiece.rawValue.movementTypes, boardState: boardState)
        let isMovementDirectionValid = isValid(move: move, movementDirection: movingPiece.rawValue.movementDirection, color: movingPiece.rawValue.color)
        return isMovementOrCaptureStrategyValid && isMovementTypeValid && isMovementDirectionValid
    }
    
    private static func isValid(move: MoveState, movementStrategies: [MovementStrategy]) -> Bool {
        return movementStrategies.first { strategy in
            switch strategy {
            case .straight:
                return isOnlyFileOrOnlyRankAdvanced(for: move)
            case .diagonal:
                return isEqualFileAndRankBothAdvanced(for: move)
            case .lShaped:
                return isLShapedAdvanced(for: move)
            }
            } != nil
    }
    
    private static func isValid(move: MoveState, movementTypes: [MovementType], boardState: BoardState) -> Bool {
        return movementTypes.first { movementType in
            switch movementType {
            case .slide:
                return isPathClear(for: move, boardState: boardState)
            case .step:
                return isOneStepAdvanced(for: move)
            case .slideFrom(let fileIndex, let rankIndex, let forNumberOfFiles, let forNumberOfRanks):
                guard fileIndex == move.fromSquare.fileIndex
                    || rankIndex == move.fromSquare.rankIndex else {
                        return isOneStepAdvanced(for: move)
                }
                return isMove(move, advancedFor: AdvancementState(fileAdvancement: forNumberOfFiles, rankAdvancement: forNumberOfRanks))
                    && isPathClear(for: move, boardState: boardState)
            case .hop:
                return true
            }
            } != nil
    }
    
    private static func isValid(move: MoveState, movementDirection: MovementDirection, color: Color) -> Bool {
        switch movementDirection {
        case .forward:
            switch color {
            case .white:
                return isRankIncremented(for: move)
            case .black:
                return isRankDecremented(for: move)
            }
        case .any:
            return true
        }
    }
    
    private static func isZeroStepAdvanced(for move: MoveState) -> Bool {
        return move.fromSquare == move.toSquare
    }
    
    private static func isOneStepAdvanced(for move: MoveState) -> Bool {
        return getAdvancement(for: move) == getSingleAdvancement(for: move)
    }
    
    private static func isOnlyFileOrOnlyRankAdvanced(for move: MoveState) -> Bool {
        return isFileAdvanced(for: move) != isRankAdvanced(for: move)
    }
    
    private static func isEqualFileAndRankBothAdvanced(for move: MoveState) -> Bool {
        let advancement = getAdvancement(for: move)
        return abs(advancement.fileAdvancement) == abs(advancement.rankAdvancement)
    }
    
    private static func isLShapedAdvanced(for move: MoveState) -> Bool {
        return isMove(move, advancedFor: AdvancementState(fileAdvancement: Constants.oneStep, rankAdvancement: Constants.twoSteps))
            || isMove(move, advancedFor: AdvancementState(fileAdvancement: Constants.twoSteps, rankAdvancement: Constants.oneStep))
    }
    
    private static func isMove(_ move: MoveState, advancedFor targetAdvancement: AdvancementState) -> Bool {
        let advancement = getAdvancement(for: move)
        return abs(advancement.fileAdvancement) == targetAdvancement.fileAdvancement && abs(advancement.rankAdvancement) == targetAdvancement.rankAdvancement
    }
    
    private static func isPathClear(for move: MoveState, boardState: BoardState) -> Bool {
        let advancement = getAdvancement(for: move)
        var positionToCheck = move.fromSquare
        let secondLastSquare = move.toSquare - getSingleAdvancement(for: advancement)
        while positionToCheck != secondLastSquare {
            positionToCheck = (positionToCheck + getSingleAdvancement(for: advancement))!
            if isSquareEmpty(positionToCheck, boardState: boardState) == false { return false }
        }
        return true
    }
    
    private static func isSquareEmpty(_ squareState: SquareState, boardState: BoardState) -> Bool {
        return boardState.squares[squareState.rankIndex.rawValue][squareState.fileIndex.rawValue]?.piece == nil
    }
    
    private static func getAdvancement(for move: MoveState) -> AdvancementState {
        return AdvancementState(fileAdvancement: move.toSquare.fileIndex - move.fromSquare.fileIndex, rankAdvancement: move.toSquare.rankIndex - move.fromSquare.rankIndex)
    }
    
    private static func getSingleAdvancement(for move: MoveState) -> AdvancementState {
        return getSingleAdvancement(for: getAdvancement(for: move))
    }
    
    private static func getSingleAdvancement(for advancement: AdvancementState) -> AdvancementState {
        var fileAdvancement = advancement.fileAdvancement
        var rankAdvancement = advancement.rankAdvancement
        fileAdvancement = fileAdvancement == 0 ? fileAdvancement : (fileAdvancement/abs(fileAdvancement))
        rankAdvancement = rankAdvancement == 0 ? rankAdvancement : (rankAdvancement/abs(rankAdvancement))
        return AdvancementState(fileAdvancement: fileAdvancement, rankAdvancement: rankAdvancement)
    }
    
    private static func isFileAdvanced(for move: MoveState) -> Bool {
        return move.fromSquare.fileIndex != move.toSquare.fileIndex
    }
    
    private static func isRankAdvanced(for move: MoveState) -> Bool {
        return move.fromSquare.rankIndex != move.toSquare.rankIndex
    }
    
    private static func isRankIncremented(for move: MoveState) -> Bool {
        return move.fromSquare.rankIndex.rawValue < move.toSquare.rankIndex.rawValue
    }
    
    private static func isRankDecremented(for move: MoveState) -> Bool {
        return move.fromSquare.rankIndex.rawValue > move.toSquare.rankIndex.rawValue
    }
    
    static func getPiece(on squareState: SquareState, boardState: BoardState) -> Piece? {
        return boardState.squares[safe: squareState.rankIndex.rawValue]?[safe: squareState.fileIndex.rawValue]??.piece
    }
    
    private static func isPiece(_ movingPiece: Piece, allowedToCapture targetPiece: Piece?) -> Bool {
        return targetPiece == nil || movingPiece.rawValue.color != targetPiece?.rawValue.color
    }
}
