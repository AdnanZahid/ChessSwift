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
        let fromSquare = move.fromSquare
        guard let piece = boardState.squares[safe: fromSquare.rank.rawValue]?[safe: fromSquare.file.rawValue]??.piece else { return false }
        let isMovementStrategySuccessful = piece.rawValue.movementStrategies.first { strategy in
            switch strategy {
            case .straight:
                return isOnlyFileOrOnlyRankAdvanced(for: move)
            case .diagonal:
                return isEqualFileAndRankBothAdvanced(for: move)
            case .lShaped:
                return isLShapedAdvanced(for: move)
            }
            } != nil
        switch piece.rawValue.movementType {
        case .slide:
            guard isPathClear(for: move, boardState: boardState) else { return false }
        case .step:
            guard isOneStepAdvanced(for: move) else { return false }
        case .hop:
            break
        }
        return isMovementStrategySuccessful
    }
}

extension LegalMovesHandler {
    
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
        let advancement = getAdvancement(for: move)
        return isOneFileTwoRanksAdvanced(for: advancement) || isTwoFilesOneRankAdvanced(for: advancement)
    }
    
    private static func isOneFileTwoRanksAdvanced(for advancement: AdvancementState) -> Bool {
        return abs(advancement.fileAdvancement) == Constants.oneStep && abs(advancement.rankAdvancement) == Constants.twoSteps
    }
    
    private static func isTwoFilesOneRankAdvanced(for advancement: AdvancementState) -> Bool {
        return abs(advancement.fileAdvancement) == Constants.twoSteps && abs(advancement.rankAdvancement) == Constants.oneStep
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
        return boardState.squares[squareState.rank.rawValue][squareState.file.rawValue]?.piece == nil
    }
    
    private static func getAdvancement(for move: MoveState) -> AdvancementState {
        return AdvancementState(fileAdvancement: move.toSquare.file - move.fromSquare.file, rankAdvancement: move.toSquare.rank - move.fromSquare.rank)
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
        return move.fromSquare.file != move.toSquare.file
    }
    
    private static func isRankAdvanced(for move: MoveState) -> Bool {
        return move.fromSquare.rank != move.toSquare.rank
    }
}
