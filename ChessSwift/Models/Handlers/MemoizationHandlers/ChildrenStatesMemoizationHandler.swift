//
//  ChildrenStatesMemoizationHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 18/09/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import Foundation

class ChildrenStatesMemoizationHandler {
    
    static var dictionary: [String: [String: Int]]  = [:]
    
    static func setChildrenStates(childrenStatesWithEvaluationValues: [String: Int], forKey key: String) {
        dictionary[key] = childrenStatesWithEvaluationValues
    }
    
    static func getChildrenStates(forKey key: String) -> [String: Int]? {
        return dictionary[key]
    }
}
