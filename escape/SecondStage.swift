//
//  SecondStage.swift
//  escape
//
//  Created by tcs16170 on 2018/11/21.
//  Copyright © 2018年 tcs14047. All rights reserved.
//

import SpriteKit
import GameplayKit
import SpriteKit
import AVFoundation

class SecondStage: SKScene, SKPhysicsContactDelegate,AVAudioPlayerDelegate {
    
    var yuka: SKSpriteNode!
    
    let whatstage: Int = 2
    
    override func didMove(to view: SKView) {
        
        let ud = UserDefaults.standard
        let whatstage = ud.integer(forKey: "whatstage")
        
        // left_buttonを画像登録して表示する
        self.yuka = SKSpriteNode(imageNamed: "yuka")
        self.yuka.position = CGPoint(x: frame.midX , y: frame.midY)
        self.yuka.xScale = 0.30
        self.yuka.yScale = 0.30
        self.yuka.zPosition = 1
        addChild(self.yuka)
        
    









































}
}
