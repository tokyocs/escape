//
//  KekkaScene.swift
//  escape
//
//  Created by tcs16172 on 2018/10/11.
//  Copyright © 2018年 tcs14047. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class KekkaScene: SKScene,AVAudioPlayerDelegate, SKPhysicsContactDelegate {
    var haikei:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        self.haikei = SKSpriteNode(imageNamed: "GAMECLEAR")
        self.haikei.xScale = view.frame.size.width/self.haikei.size.width
        self.haikei.yScale = view.frame.size.height/self.haikei.size.height
        self.haikei.position = CGPoint(x: size.width*0.5 , y: size.height*0.5)
        addChild(self.haikei)
        

        
    }
    
}
