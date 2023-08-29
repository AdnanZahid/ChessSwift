//
//  GUIView.swift
//  Chess
//
//  Created by Adnan Zahid on 8/24/16.
//  Copyright © 2016 Chess. All rights reserved.
//

import SceneKit

class GUIView: SCNView {
    
    private enum PieceLiftDirection: Float {
        case up   = 0.5
        case down = 0
    }
    
    var isGUIViewAvailable = true
    
    weak var inputHandlerDelegate: InputHandlerDelegate?
    
    var cameraNode: SCNNode?
    var liftedPiece: SCNNode?
    var liftedPieceMovesBoard: SCNNode?
    
    var pieceNodeArray = [[SCNNode?]](repeating: [SCNNode?](repeating: nil, count: RankIndex._8.rawValue - RankIndex._1.rawValue + 1),
                                      count: FileIndex._H.rawValue - FileIndex._A.rawValue + 1)
    
    func setupView() {
        
        scene = SCNScene()
        
        allowsCameraControl = true
        showsStatistics = true
        backgroundColor = UIColor.black
        
        cameraNode = SCNNode()
        cameraNode?.camera = SCNCamera()
        scene?.rootNode.addChildNode(cameraNode!)
        
        cameraNode?.position = SCNVector3(UIConstants.whiteCameraXPosition, UIConstants.whiteCameraYPosition, UIConstants.whiteCameraZPosition)
        cameraNode?.eulerAngles = SCNVector3(UIConstants.whiteCameraXRotation, UIConstants.whiteCameraYRotation, UIConstants.whiteCameraZRotation)
        
        let cameraTarget = SCNNode()
        cameraTarget.position = SCNVector3(UIConstants.whiteCameraXPosition, 0.0, UIConstants.whiteCameraXPosition)
        let lookAtCenter = SCNLookAtConstraint(target: cameraTarget)
        
        cameraNode?.constraints = [lookAtCenter]
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = SCNLight.LightType.omni
        lightNode.position = SCNVector3(UIConstants.lightXPosition, UIConstants.lightYPosition, UIConstants.lightZPosition)
        scene?.rootNode.addChildNode(lightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = SCNLight.LightType.ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GUIView.handleTap(_:)))
        gestureRecognizers?.append(tapGesture)
        
        scene?.rootNode.addChildNode(getChessBoard())
    }
    
    func getChessBoard() -> SCNNode {
        let lightSquare = SCNBox(width: UIConstants.squareWidth, height: UIConstants.squareHeight, length: UIConstants.squareLength, chamferRadius: UIConstants.squareChamferRadius)
        let darkSquare = lightSquare.copy() as! SCNBox
        
        let lightMaterial = SCNMaterial()
        let lightColor = UIColor(red: UIConstants.lightSquareRed, green: UIConstants.lightSquareGreen, blue: UIConstants.lightSquareBlue, alpha: UIConstants.lightSquareAlpha)
        lightMaterial.diffuse.contents = lightColor
        
        let darkMaterial = lightMaterial.copy() as! SCNMaterial
        darkMaterial.diffuse.contents = UIColor(white: UIConstants.darkSquareWhite, alpha: UIConstants.darkSquareAlpha)
        
        lightSquare.firstMaterial = lightMaterial
        darkSquare.firstMaterial = darkMaterial
        
        let boardNode = SCNNode()
        boardNode.position = SCNVector3Zero
        
        Array(RankIndex._1.rawValue...RankIndex._8.rawValue).forEach { rank in
            Array(FileIndex._A.rawValue...FileIndex._H.rawValue).forEach { file in
                let isBlack = (rank + file) % 2 != 0
                let geometry = isBlack ? darkSquare : lightSquare
                let squareNode = SCNNode(geometry: geometry)
                squareNode.position = SCNVector3(-file, 0, -rank)
                boardNode.addChildNode(squareNode)
                squareNode.name = "SQUARE"
            }
        }
        
        return boardNode
    }
    
    func getMovesBoard(moveStates: [MoveState], fromSquare: SquareState) -> SCNNode {
        let boardNode = SCNNode()
        boardNode.position = SCNVector3Zero
        Array(RankIndex._1.rawValue...RankIndex._8.rawValue).forEach { rank in
            Array(FileIndex._A.rawValue...FileIndex._H.rawValue).forEach { file in
                let shouldApplyGreen = moveStates.contains(MoveState(fromSquare: fromSquare,
                                                                     toSquare: SquareState(fileIndex: FileIndex(rawValue: file)!,
                                                                                           rankIndex: RankIndex(rawValue: rank)!)))
                if shouldApplyGreen {
                    let square = SCNBox(width: UIConstants.squareWidth,
                                        height: UIConstants.squareHeight,
                                        length: UIConstants.squareLength,
                                        chamferRadius: UIConstants.squareChamferRadius)
                    let material = SCNMaterial()
                    material.diffuse.contents = UIColor(red: 0, green: UIConstants.lightSquareGreen, blue: 0, alpha: UIConstants.lightSquareAlpha)
                    square.firstMaterial = material
                    let squareNode = SCNNode(geometry: square)
                    squareNode.position = SCNVector3(file + UIConstants.pieceXOffset, 0, -rank)
                    boardNode.addChildNode(squareNode)
                    squareNode.name = "GREEN"
                }
            }
        }
        
        return boardNode
    }
    
    @objc func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        let point = gestureRecognizer.location(in: self)
        let hitResults = hitTest(point, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            animateWithAction { [unowned self] in
                if self.liftedPiece != nil {
                    self.moveToSquare(node)
                } else if node.name == "PIECE" && self.liftedPiece == nil {
                    self.liftPiece(node, direction: .up)
                }
            }
        }
    }
    
    private func liftPiece(_ node: SCNNode, direction: PieceLiftDirection) {
        liftedPiece = node
        animateWithAction { node.position.y = direction.rawValue }
        
        switch direction {
        case .down:
            scene?.rootNode.childNodes.forEach { $0.childNodes.forEach { if $0.name == "GREEN" { $0.removeFromParentNode() } } }
        case .up:
            let fromSquare = SquareState(fileIndex: FileIndex(rawValue: Int(liftedPiece!.position.x) - UIConstants.pieceXOffset)!,
                                         rankIndex: RankIndex(rawValue: -Int(liftedPiece!.position.z))!)
            scene?.rootNode.addChildNode(getMovesBoard(moveStates: (inputHandlerDelegate?.getMoves(forPieceOn: fromSquare))!, fromSquare: fromSquare))
        }
    }
    
    func moveToSquare(_ node: SCNNode) {
        let fromSquare = SquareState(fileIndex: FileIndex(rawValue: Int(liftedPiece!.position.x) - UIConstants.pieceXOffset)!,
                                     rankIndex: RankIndex(rawValue: -Int(liftedPiece!.position.z))!)
        let toSquare = SquareState(fileIndex: FileIndex(rawValue: Int(node.position.x) - UIConstants.pieceXOffset)!,
                                   rankIndex: RankIndex(rawValue: -Int(node.position.z))!)
        let move = MoveState(fromSquare: fromSquare, toSquare: toSquare)
        inputHandlerDelegate?.didTakeInput(move)
    }
    
    func animateWithAction(_ action: () -> ()) {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = UIConstants.animationDuration
        action()
        SCNTransaction.commit()
    }
}

extension GUIView: OutputHandler {
    
    func input(gameState: GameState) {
    }
    
    func setup(boardState: any BoardStateProtocol) {
        Array(RankIndex._1.rawValue...RankIndex._8.rawValue).forEach { rank in
            Array(FileIndex._A.rawValue...FileIndex._H.rawValue).forEach { file in
                let boardState = (boardState as? BitBoardState)
                guard let piece = boardState?.state[rank][file]?.piece else { return }
                let pieces = SCNScene(named: "art.scnassets/ChessPieces.dae")!
                let node = pieces.rootNode.childNode(withName: piece.rawValue.symbol.uppercased(), recursively: true)!
                if piece.rawValue.color == .black {
                    let blackMaterial = node.geometry!.firstMaterial!
                    blackMaterial.diffuse.contents = UIColor(white: UIConstants.darkSquareWhite, alpha: UIConstants.darkSquareAlpha)
                    node.geometry!.firstMaterial = blackMaterial
                }
                
                node.position = SCNVector3(file + UIConstants.pieceXOffset, 0, -rank)
                node.eulerAngles = SCNVector3(UIConstants.pieceXRotation, 0.0, 0.0)
                node.scale = SCNVector3(UIConstants.pieceXScale, UIConstants.pieceYScale, UIConstants.pieceZScale)
                scene?.rootNode.addChildNode(node)
                node.name = "PIECE"
                pieceNodeArray[rank - UIConstants.startingRankPosition][file - UIConstants.startingFilePosition] = node
            }
        }
    }
    
    func output(move: MoveState, boardState: any BoardStateProtocol) {
        let fromFile = move.fromSquare.fileIndex.rawValue - UIConstants.startingFilePosition
        let fromRank = move.fromSquare.rankIndex.rawValue - UIConstants.startingRankPosition
        
        let toFile = move.toSquare.fileIndex.rawValue - UIConstants.startingFilePosition
        let toRank = move.toSquare.rankIndex.rawValue - UIConstants.startingRankPosition
        
        guard let node = pieceNodeArray[fromRank][fromFile] else {
            liftedPiece = nil
            return
        }
        
        if let existingNode = pieceNodeArray[toRank][toFile] {
            existingNode.removeFromParentNode()
        }
        
        pieceNodeArray[toRank][toFile] = node
        pieceNodeArray[fromRank][fromFile] = nil
        liftedPiece = nil
        
        animateWithAction {
            node.position = SCNVector3(toFile + UIConstants.startingFilePosition + UIConstants.pieceXOffset, 0, -(toRank + UIConstants.startingRankPosition))
        }

        scene?.rootNode.childNodes.forEach { $0.childNodes.forEach { if $0.name == "GREEN" { $0.removeFromParentNode() } } }
    }
    
    func cancelMove() {
        liftPiece(liftedPiece!, direction: .down)
        liftedPiece = nil
    }
}
