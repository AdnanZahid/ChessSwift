//
//  MovementStrategyHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 02/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

struct BitBoardMovementStrategyHandler {
    
    enum Constants {
        static let oneStep = 1
        static let twoSteps = 2
    }

}

extension BitBoardMovementStrategyHandler: MovementStrategyHandlerProtocol {
    
    func isValid(move: MoveState, movementStrategies: [MovementStrategy]) -> Bool {
        movementStrategies.first { strategy in
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
    
    private func isOnlyFileOrOnlyRankAdvanced(for move: MoveState) -> Bool {
        isFileAdvanced(for: move) != isRankAdvanced(for: move)
    }
    
    private func isEqualFileAndRankBothAdvanced(for move: MoveState) -> Bool {
        let advancement = getAdvancement(for: move)
        return abs(advancement.fileAdvancement) == abs(advancement.rankAdvancement)
    }
    
    private func isLShapedAdvanced(for move: MoveState) -> Bool {
        isMove(move, advancedFor: AdvancementState(fileAdvancement: Constants.oneStep, rankAdvancement: Constants.twoSteps))
            || isMove(move, advancedFor: AdvancementState(fileAdvancement: Constants.twoSteps, rankAdvancement: Constants.oneStep))
    }
    
    private func isMove(_ move: MoveState, advancedFor targetAdvancement: AdvancementState) -> Bool {
        let advancement = getAdvancement(for: move)
        return abs(advancement.fileAdvancement) == targetAdvancement.fileAdvancement && abs(advancement.rankAdvancement) == targetAdvancement.rankAdvancement
    }
    
    private func isFileAdvanced(for move: MoveState) -> Bool {
        move.fromSquare.fileIndex != move.toSquare.fileIndex
    }
    
    private func isRankAdvanced(for move: MoveState) -> Bool {
        move.fromSquare.rankIndex != move.toSquare.rankIndex
    }
    
    private func getAdvancement(for move: MoveState) -> AdvancementState {
        AdvancementState(fileAdvancement: move.toSquare.fileIndex - move.fromSquare.fileIndex, rankAdvancement: move.toSquare.rankIndex - move.fromSquare.rankIndex)
    }
}
