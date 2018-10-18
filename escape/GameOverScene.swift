//
//  GameOverScene.swift
//  escape
//
//  Created by tcs16170 on 2018/10/17.
//  Copyright © 2018年 tcs14047. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameOverScene: SKScene,AVAudioPlayerDelegate, SKPhysicsContactDelegate {
    var haikei:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        self.haikei = SKSpriteNode(imageNamed: "gameover")
        self.haikei.xScale = 1.2
        self.haikei.yScale = 1.2
        self.haikei.position = CGPoint(x: frame.midX , y: frame.midY)
        addChild(self.haikei)
    }
}
