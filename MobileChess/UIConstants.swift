//
//  UIConstants.swift
//  Chess
//
//  Created by Adnan Zahid on 8/24/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import SceneKit

enum UIConstants {
    static let startingFilePosition = 0
    static let startingRankPosition = 0
    
    static let pieceXOffset = -7
    
    static let pieceXRotation = Double.pi/2
    
    static let pieceXScale = 0.67
    static let pieceYScale = 0.67
    static let pieceZScale = 0.67
    
    static let squareWidth: CGFloat = 1.0
    static let squareHeight: CGFloat = 0.2
    static let squareLength: CGFloat = 1.0
    static let squareChamferRadius: CGFloat = 0.0
    
    static let lightSquareRed: CGFloat = 0.9
    static let lightSquareGreen: CGFloat = 0.85
    static let lightSquareBlue: CGFloat = 0.8
    static let lightSquareAlpha: CGFloat = 1.0
    
    static let darkSquareWhite: CGFloat = 0.15
    static let darkSquareAlpha: CGFloat = 1.0
    
    static let animationDuration = 0.5
    
    static let whiteCameraXPosition = -3.5
    static let whiteCameraYPosition = 12.0
    static let whiteCameraZPosition = 5.0
    
    static let blackCameraXPosition = 3.5
    static let blackCameraYPosition = 12.0
    static let blackCameraZPosition = -7.0
    
    static let whiteCameraXRotation = 0.0
    static let whiteCameraYRotation = 0.0
    static let whiteCameraZRotation = 0.0
    
    static let blackCameraXRotation = 0.0
    static let blackCameraYRotation = 0.0
    static let blackCameraZRotation = Double.pi
    
    static let lightXPosition = 0.0
    static let lightYPosition = 10.0
    static let lightZPosition = 10.0
    
    static let capturedPieceZDistance = 10.0
}
