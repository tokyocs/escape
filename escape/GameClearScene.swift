//
//  GameClearScene.swift
//  escape
//
//  Created by tcs16170 on 2018/12/22.
//  Copyright © 2018年 tcs14047. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import SpriteKit
import AVFoundation

class GameClearScene: SKScene,AVAudioPlayerDelegate, SKPhysicsContactDelegate {
    var haikei:SKSpriteNode!
    var nextbutton:SKSpriteNode!
    let whatstage: Int = 2
    
    override func didMove(to view: SKView) {
        
        let ud = UserDefaults.standard
        _ = ud.integer(forKey: "whatstage")
        
        self.haikei = SKSpriteNode(imageNamed: "GAMECLEAR")
        self.haikei.xScale = 0.75
        self.haikei.yScale = 0.8
        self.haikei.position = CGPoint(x: size.width*0.5 , y: size.height*0.5)
        self.haikei.zPosition = -1
        addChild(self.haikei)
        

        
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
        // タッチされているオブジェクトから、
        for touch: AnyObject in touches {
            // タッチした場所を取得する。
            let location = touch.location(in: self)
            // タッチされたノードを選択して、ボタンと触れたかを判定する。
            let touchNode = self.atPoint(location)
            // 右のボタンが押されたら右に30px動かす。
            if touchNode == nextbutton {
                // 右に動く動きを指定する。
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    // 結果シーンに遷移させる。
                    let ud = UserDefaults.standard
                    ud.set(self.whatstage, forKey: "whatstage")
                    
                    
                    let newScene = SecondStage(size: (self.scene?.size)!)
                    newScene.scaleMode = SKSceneScaleMode.aspectFill
                    self.view?.presentScene(newScene)
                    
                    
                    
                }
            }
            
        }
        
        
        
    }
    
    
}
