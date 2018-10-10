//
//  GameScene.swift
//  escape
//
//  Created by tcs14047 on 2018/09/26.
//  Copyright © 2018年 tcs14047. All rights reserved.
//

import SpriteKit
import GameplayKit
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var left_button: SKSpriteNode!
    
    var right_button: SKSpriteNode!
    var up_button: SKSpriteNode!
    var under_button: SKSpriteNode!
    var newmap: SKSpriteNode!
    var hero: SKSpriteNode!
    var node1: SKSpriteNode!
    var node2: SKSpriteNode!
    var node4: SKSpriteNode!
    var node5: SKSpriteNode!
    var node3: SKSpriteNode!
    let Node1: UInt32 = 0b0001
    let Node2: UInt32 = 0b0010
    let Node3: UInt32 = 0b0011
    let Hero: UInt32 = 0b0100

    private var label : SKLabelNode?
    
    override func didMove(to view: SKView) {
        
        //壁１
        self.node1 = SKSpriteNode(imageNamed:"node1")
        self.node1.position = CGPoint(x: frame.midX, y: frame.midY-100)
        self.node1.physicsBody = SKPhysicsBody(rectangleOf: node1.size)
        self.node1.physicsBody?.affectedByGravity = false
        self.node1.physicsBody?.isDynamic = false
        self.node1.physicsBody?.categoryBitMask = Node1
        self.node1.xScale = 0.2
        self.node1.yScale = 0.2
        addChild(self.node1)
        
        self.node4 = SKSpriteNode(imageNamed:"node4")
        self.node4.position = CGPoint(x: frame.midX-100, y: frame.midY-45)
        self.node4.physicsBody = SKPhysicsBody(rectangleOf: node1.size)
        self.node4.physicsBody?.affectedByGravity = false
        self.node4.physicsBody?.isDynamic = false
        self.node4.physicsBody?.categoryBitMask = Node1
        self.node4.xScale = 0.2
        self.node4.yScale = 0.2
        addChild(self.node4)
        
        self.node5 = SKSpriteNode(imageNamed:"node5")
        self.node5.position = CGPoint(x: frame.midX-100, y: frame.midY-45)
        self.node5.physicsBody = SKPhysicsBody(rectangleOf: node1.size)
        self.node5.physicsBody?.affectedByGravity = false
        self.node5.physicsBody?.isDynamic = false
        self.node5.physicsBody?.categoryBitMask = Node1
        self.node5.xScale = 0.2
        self.node5.yScale = 0.2
        addChild(self.node5)
        
        //壁２
        self.node2 = SKSpriteNode(imageNamed:"node2")
        self.node2.position = CGPoint(x: frame.midX, y: frame.midY-130)
        self.node2.physicsBody = SKPhysicsBody(rectangleOf: node2.size)
        self.node2.physicsBody?.affectedByGravity = false
        self.node2.physicsBody?.isDynamic = false
        self.node2.physicsBody?.categoryBitMask = Node2
        self.node2.xScale = 0.2
        self.node2.yScale = 0.2
        addChild(self.node2)
        
        //壁３
        self.node3 = SKSpriteNode(imageNamed:"node3")
        self.node3.position = CGPoint(x: frame.midX, y: frame.midY-160)
        self.node3.physicsBody = SKPhysicsBody(rectangleOf: node3.size)
        self.node3.physicsBody?.affectedByGravity = false
        self.node3.physicsBody?.isDynamic = false
        self.node3.physicsBody?.categoryBitMask = Node3
        self.node3.xScale = 0.2
        self.node3.yScale = 0.2
        addChild(self.node3)
        // left_buttonを画像登録して表示する
        self.left_button = SKSpriteNode(imageNamed: "left_button")
        self.left_button.position = CGPoint(x:-330 , y:-180)
        self.left_button.xScale = 0.15
        self.left_button.yScale = 0.15
        self.left_button.zPosition = 0
        addChild(self.left_button)
        
        // right_buttonを画像登録して表示する
        self.right_button = SKSpriteNode(imageNamed: "right_button")
        self.right_button.position = CGPoint(x:-270, y:-180)
        self.right_button.xScale = 0.15
        self.right_button.yScale = 0.15
        self.right_button.zPosition = 0
        addChild(self.right_button)
        
        // under_buttonを画像登録して表示する
        self.under_button = SKSpriteNode(imageNamed: "under_button")
        self.under_button.position = CGPoint(x:-300, y:-210)
        self.under_button.xScale = 0.15
        self.under_button.yScale = 0.15
        self.under_button.zPosition = 0
        addChild(self.under_button)
        
        // up_button を画像登録して表示する
        self.up_button = SKSpriteNode(imageNamed: "up_button")
        self.up_button.position = CGPoint(x:-300, y:-150)
        self.up_button.xScale = 0.15
        self.up_button.yScale = 0.15
        self.up_button.zPosition = 0
        addChild(self.up_button)

        
        self.newmap = SKSpriteNode(imageNamed: "newmap")
        self.newmap.xScale = 1.5
        self.newmap.yScale = 1
        self.newmap.position = CGPoint(x: 0, y: 0)
        self.newmap.zPosition = -1.0
        addChild(self.newmap)
        self.hero = SKSpriteNode(imageNamed: "hero")
        self.hero.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.hero.position = CGPoint(x:0, y:0)
        self.hero.physicsBody = SKPhysicsBody(rectangleOf: hero.size)
        self.hero.physicsBody?.affectedByGravity = false
        self.hero.physicsBody?.isDynamic = true
        self.hero.physicsBody?.categoryBitMask = Hero
        addChild(self.hero)

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
