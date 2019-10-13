//
//  GameScene.swift
//  ColorBee
//
//  Created by damien on 11/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let cameraNode = SKCameraNode()
    
    override func didMove(to view: SKView) {
        
        physicsWorld.gravity.dy = -5
        
        camera = cameraNode
        addChild(cameraNode)
        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
   
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
}
