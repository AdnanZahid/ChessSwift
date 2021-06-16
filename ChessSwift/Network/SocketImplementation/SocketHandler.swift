//
//  SocketHandler.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 14/06/2021.
//  Copyright © 2021 Adnan Zahid. All rights reserved.
//

import Foundation
import SocketIO

protocol SocketHandlerDelegate: class {
//    func didConnect()
//    func didReceive(position: SocketPosition)
}

class SocketHandler {

    // MARK: - Delegate
    weak var delegate: SocketHandlerDelegate?

    // MARK: - Properties
    let manager = SocketManager(socketURL: URL(string: "http://127.0.0.1:3000")!, config: [.log(false), .compress, .secure(false)])
    var socket: SocketIOClient? = nil

    // MARK: - Life Cycle
    init(_ delegate: SocketHandlerDelegate) {
        self.delegate = delegate
        setupSocket()
        setupSocketEvents()
        socket?.connect()
    }

    func stop() {
        socket?.removeAllHandlers()
    }

    // MARK: - Socket Setups
    func setupSocket() {
        socket = manager.defaultSocket
    }

    
    func setupSocketEvents() {

        socket?.on(clientEvent: .connect) { data, ack in
//            self.delegate?.didConnect()
            print("Did connect")
        }

        socket?.on("drawing") { (data, ack) in
            print("Did draw")
            guard let dataInfo = data.first else { return }
//            if let response: SocketPosition = try? SocketParser.convert(data: dataInfo) {
//                let position = CGPoint.init(x: response.x, y: response.y)
//                self.delegate?.didReceive(point: position)
//            }
        }
    }

    // MARK: - Socket Emits
//    func socketChanged(position: SocketPosition) {
//        let info: [String : Any] = [
//            "x": Double(position.x),
//            "y": Double(position.y)
//        ]
//        socket?.emit("drawing", info)
//    }

}
