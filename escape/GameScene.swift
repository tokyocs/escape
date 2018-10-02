//
//  GameScene.swift
//  escape
//
//  Created by tcs14047 on 2018/09/26.
//  Copyright © 2018年 tcs14047. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var newmap: SKSpriteNode!

    
    private var label : SKLabelNode?
    
    override func didMove(to view: SKView) {
        self.newmap = SKSpriteNode(imageNamed: "newmap")
        self.newmap.xScale = 1.5
        self.newmap.yScale = 1
        self.newmap.position = CGPoint(x: 0, y: 0)
        self.newmap.zPosition = -1.0
        addChild(self.newmap)

    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
