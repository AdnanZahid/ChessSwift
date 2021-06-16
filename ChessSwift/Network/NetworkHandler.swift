//
//  NetworkHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 14/06/2021.
//  Copyright © 2021 Adnan Zahid. All rights reserved.
//

import Foundation

class NetworkHandler {
    
    var isGUIViewAvailable = false
    var handler: SocketHandler?
    weak var inputHandlerDelegate: InputHandlerDelegate?
    
    init() {
        handler = SocketHandler(self)
    }
}

extension NetworkHandler: SocketHandlerDelegate {
}

extension NetworkHandler: InputHandler {

    func input(gameState: GameState) {
    }
    
}

extension NetworkHandler: OutputHandler {

    func setup(boardState: BoardState) {
    }

    func output(move: MoveState, boardState: BoardState) {
    }

    func cancelMove() {
    }

}
