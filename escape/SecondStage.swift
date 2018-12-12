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
    var left_button: SKSpriteNode!
    var right_button: SKSpriteNode!
    var under_button: SKSpriteNode!
    var up_button: SKSpriteNode!
    var hero: SKSpriteNode!
    
    
    let whatstage: Int = 2
    
    let heroCategory: UInt32 = 1 << 3    // heroCategory、壁のカテゴリを0x00000100で設定。
    let monsterCategory: UInt32 = 1 << 4    // wallCategory、壁のカテゴリを0x00001000で設定。
    let wallCategory: UInt32 = 1 << 1    // wallCategory、壁のカテゴリを0x00000001で設定。
    let shelfCategory: UInt32 = 1 << 2    // shelfCategory、棚のカテゴリを0x00000010で設定。
    
    override func didMove(to view: SKView) {
        
        let ud = UserDefaults.standard
        let whatstage = ud.integer(forKey: "whatstage")
        
        // yukaを画像登録して表示する
        self.yuka = SKSpriteNode(imageNamed: "yuka")
        self.yuka.position = CGPoint(x: frame.midX , y: frame.midY)
        self.yuka.xScale = 2
        self.yuka.yScale = 2
        self.yuka.zPosition = 1
        addChild(self.yuka)
        
        // left_buttonを画像登録して表示する
        self.left_button = SKSpriteNode(imageNamed: "left_button")
        self.left_button.position = CGPoint(x:100 , y:100)
        self.left_button.xScale = 0.30
        self.left_button.yScale = 0.30
        self.left_button.zPosition = 3
        addChild(self.left_button)
        
        // right_buttonを画像登録して表示する
        self.right_button = SKSpriteNode(imageNamed: "right_button")
        self.right_button.position = CGPoint(x:180, y:100)
        self.right_button.xScale = 0.30
        self.right_button.yScale = 0.30
        self.right_button.zPosition = 3
        addChild(self.right_button)
        
        // under_buttonを画像登録して表示する
        self.under_button = SKSpriteNode(imageNamed: "under_button")
        self.under_button.position = CGPoint(x:-300, y:-240)
        self.under_button.xScale = 0.30
        self.under_button.yScale = 0.30
        self.under_button.zPosition = 3
        addChild(self.under_button)
        
        // up_button を画像登録して表示する
        self.up_button = SKSpriteNode(imageNamed: "up_button")
        self.up_button.position = CGPoint(x:-300, y:-120)
        self.up_button.xScale = 0.30
        self.up_button.yScale = 0.30
        self.up_button.zPosition = 3
        addChild(self.up_button)
        
        self.hero = SKSpriteNode(imageNamed: "hero")
        self.hero.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
        self.hero.zPosition = 2
        self.hero.position = CGPoint(x:0, y:0)
        self.hero.physicsBody = SKPhysicsBody(rectangleOf: hero.size)
        self.hero.physicsBody?.categoryBitMask = heroCategory
        self.hero.physicsBody?.contactTestBitMask = monsterCategory
        self.hero.physicsBody?.collisionBitMask = heroCategory|monsterCategory|wallCategory|shelfCategory
        self.hero.physicsBody?.affectedByGravity = false
        self.hero.physicsBody?.isDynamic = true
        self.hero.physicsBody?.allowsRotation = false
        self.hero.physicsBody?.usesPreciseCollisionDetection = true
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
                
                
                func didBegin(_ contact: SKPhysicsContact) {
                    print("contact")
                    var firstBody: SKPhysicsBody
                    var secondBody: SKPhysicsBody
                    if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
                        firstBody = contact.bodyA
                        secondBody = contact.bodyB
                    } else {
                        firstBody = contact.bodyB
                        secondBody = contact.bodyA
                    }
                    if ((firstBody.categoryBitMask == heroCategory)&&(secondBody.categoryBitMask == monsterCategory)){
            }
        }
        
    }









































}


}
}
