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
    var left_button: SKSpriteNode!
    
    var right_button: SKSpriteNode!
    var up_button: SKSpriteNode!
    var under_button: SKSpriteNode!
    var newmap: SKSpriteNode!
    var hero: SKSpriteNode!

    private var label : SKLabelNode?
    
    override func didMove(to view: SKView) {
        // left_buttonを画像登録して表示する
        self.left_button = SKSpriteNode(imageNamed: "left_button")
        self.left_button.position = CGPoint(x:-300 , y:0)
        self.left_button.xScale = 0.3
        self.left_button.yScale = 0.3
        self.left_button.zPosition = 0
        addChild(self.left_button)
        
        // right_buttonを画像登録して表示する
        self.right_button = SKSpriteNode(imageNamed: "right_button")
        self.right_button.position = CGPoint(x:300, y:0)
        self.right_button.xScale = 0.3
        self.right_button.yScale = 0.3
        self.right_button.zPosition = 0
        addChild(self.right_button)
        
        // under_buttonを画像登録して表示する
        self.under_button = SKSpriteNode(imageNamed: "under_button")
        self.under_button.position = CGPoint(x:0, y:-200)
        self.under_button.xScale = 0.3
        self.under_button.yScale = 0.3
        self.under_button.zPosition = 0
        addChild(self.under_button)
        
        // up_button を画像登録して表示する
        self.up_button = SKSpriteNode(imageNamed: "up_button")
        self.up_button.position = CGPoint(x:0, y:200)
        self.up_button.xScale = 0.3
        self.up_button.yScale = 0.3
        self.up_button.zPosition = 0
        addChild(self.up_button)

        
        self.newmap = SKSpriteNode(imageNamed: "newmap")
        self.newmap.xScale = 1.5
        self.newmap.yScale = 1
        self.newmap.position = CGPoint(x: 0, y: 0)
        self.newmap.zPosition = -1.0
        addChild(self.newmap)
        
        //heroを画像登録して表示する
        self.hero = SKSpriteNode(imageNamed: "hero")
        self.hero.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.hero.position = CGPoint(x:0, y:0)
        addChild(self.hero)
        

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
        // タッチされているオブジェクトから、
        for touch: AnyObject in touches {
            // タッチした場所を取得する。
            let location = touch.location(in: self)
            // タッチされたノードを選択して、ボタンと触れたかを判定する。
            let touchNode = self.atPoint(location)
            // 右のボタンが押されたら右に30px動かす。
            if touchNode == right_button {
                // 右に動く動きを指定する。
                let moveToRight = SKAction.moveTo(x: self.hero.position.x + 30, duration: 0.2)
                // 右に動かす。
                hero.run(moveToRight)
                // 左のボタンが押されたら左に30px動かす。
            }else if touchNode == left_button {
                // 左に動く動きを指定する。
                let moveToLeft = SKAction.moveTo(x: self.hero.position.x - 30, duration: 0.2)
                // 左に動かす。
              hero.run(moveToLeft)
            
                // 下のボタンが押されたら下に30px動かす。
            }else if touchNode == under_button {
                    // 下に動く動きを指定する。
                    let moveToUp = SKAction.moveTo(y: self.hero.position.y - 30, duration: 0.2)
                    // 下に動かす。
                    hero.run(moveToUp)
                
                // 上のボタンが押されたら上に30px動かす。
            }else if touchNode == up_button {
                // 上に動く動きを指定する。
                let moveToUp = SKAction.moveTo(y: self.hero.position.y + 30, duration: 0.2)
                // 上に動かす。
                hero.run(moveToUp)
                
            }
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
