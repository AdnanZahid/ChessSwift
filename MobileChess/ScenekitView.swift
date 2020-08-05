//
//  ScenekitView.swift
//  MobileChess
//
//  Created by Adnan Zahid on 01/08/2020.
//  Copyright © 2020 Adnan Zahid. All rights reserved.
//

import SwiftUI
import SceneKit

struct ScenekitView: UIViewRepresentable {
    
    private var controller = Controller(view: GUIView())
    
    func makeUIView(context: Context) -> SCNView {
        controller.outputHandler as! SCNView
    }
    
    func updateUIView(_ scnView: SCNView, context: Context) {
        (controller.outputHandler as! GUIView).setupView()
        (controller.outputHandler as! GUIView).setup(boardState: controller.gameState.boardState)
    }
}

#if DEBUG
struct ScenekitView_Previews: PreviewProvider {
    static var previews: some View {
        ScenekitView()
    }
}
#endif
