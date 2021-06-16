//
//  SocketParser.swift
//  ChessSwift
//
//  Created by Adnan Zahid on 14/06/2021.
//  Copyright © 2021 Adnan Zahid. All rights reserved.
//

import Foundation

class SocketParser {

    static func convert<T: Decodable>(data: Any) throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: data)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: jsonData)
    }

}
