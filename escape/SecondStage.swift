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
    
    var right_button: SKSpriteNode!
    var up_button: SKSpriteNode!
    var under_button: SKSpriteNode!
    var left_button: SKSpriteNode!
    var newmap: SKSpriteNode!
    var yuka: SKSpriteNode!
    var hero: SKSpriteNode!
    var monster2: SKSpriteNode!
    
    var shelf: SKSpriteNode!
    var shelf2: SKSpriteNode!
    var Ladders: SKSpriteNode!
    
    var node1: SKSpriteNode!
    var node2: SKSpriteNode!
    var node3: SKSpriteNode!
    var node4: SKSpriteNode!
    
    var timer: Timer?
    var timer2: Timer?
    
    let whatstage: Int = 1
    
    
    //制限時間
    var timer3: Int = 5
    
    let wallCategory: UInt32 = 1 << 1    // wallCategory、壁のカテゴリを0x00000001で設定。
    let shelfCategory: UInt32 = 1 << 2    // shelfCategory、棚のカテゴリを0x00000010で設定。
    let heroCategory: UInt32 = 1 << 4    // heroCategory、壁のカテゴリを0x00000100で設定。
    let monsterCategory: UInt32 = 1 << 8    // wallCategory、壁のカテゴリを0x00001000で設定。
    
    
    var BGMPlayer: AVAudioPlayer!
    var gameover: SKSpriteNode!
    func playBGM(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("r4")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            BGMPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
            BGMPlayer.delegate = self
            BGMPlayer.numberOfLoops = -1
            
            // 音声の再生
            BGMPlayer.play()
        } catch {
        }
    }
    
    
    private var label : SKLabelNode?

    override func didMove(to view: SKView) {
        
        let ud = UserDefaults.standard
        _ = ud.integer(forKey: "whatstage")
        

        
                self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
                playBGM(name: "r4")
                // override func didMove(to view: SKView) {の関数の中で宣言する。
                self.physicsWorld.contactDelegate = self
                
                //残りの時間を減らす
                timer2 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                    
                    self.timer3 = self.timer3 - 1
                    //0秒になったらゲームクリア
                    if(self.timer3 <= 0) {
                        self.gameClear()
                    }
                })
                
                //壁１
                self.node1 = SKSpriteNode(imageNamed:"node1")
                self.node1.position = CGPoint(x: frame.midX - 150, y: frame.midY - 150)
                self.node1.physicsBody = SKPhysicsBody(rectangleOf: node1.size)
                self.node1.physicsBody?.affectedByGravity = false
                self.node1.physicsBody?.isDynamic = false
                self.node1.physicsBody?.categoryBitMask = wallCategory
                self.node1.physicsBody?.collisionBitMask = wallCategory|monsterCategory|heroCategory
                self.node1.physicsBody?.usesPreciseCollisionDetection = true
                self.node1.xScale = 1
                self.node1.yScale = 0.7
                addChild(self.node1)
                
                //壁２
                self.node2 = SKSpriteNode(imageNamed:"node2")
                self.node2.position = CGPoint(x: frame.midX + 355, y: frame.midY - 100)
                self.node2.physicsBody = SKPhysicsBody(rectangleOf: node2.size)
                self.node2.physicsBody?.affectedByGravity = false
                self.node2.physicsBody?.isDynamic = false
                self.node2.physicsBody?.categoryBitMask = wallCategory
                self.node2.physicsBody?.collisionBitMask = wallCategory|monsterCategory|heroCategory
                self.node2.physicsBody?.usesPreciseCollisionDetection = true
                self.node2.xScale = 0.5
                self.node2.yScale = 0.4
                addChild(self.node2)
                
                //壁３
                self.node3 = SKSpriteNode(imageNamed:"node3")
                self.node3.position = CGPoint(x:frame.midX + 500, y: frame.midY)
                self.node3.physicsBody = SKPhysicsBody(rectangleOf: node3.size)
                self.node3.physicsBody?.affectedByGravity = false
                self.node3.physicsBody?.isDynamic = false
                self.node3.physicsBody?.categoryBitMask = wallCategory
                self.node3.physicsBody?.collisionBitMask = wallCategory|monsterCategory|heroCategory
                self.node3.physicsBody?.usesPreciseCollisionDetection = true
                self.node3.xScale = 0.5
                self.node3.yScale = 2
                addChild(self.node3)
                
                //壁４
                self.node4 = SKSpriteNode(imageNamed:"node4")
                self.node4.position = CGPoint(x: frame.midX - 360, y: frame.midY)
                self.node4.physicsBody = SKPhysicsBody(rectangleOf: node4.size)
                self.node4.physicsBody?.affectedByGravity = false
                self.node4.physicsBody?.isDynamic = false
                self.node4.physicsBody?.categoryBitMask = wallCategory
                self.node4.physicsBody?.collisionBitMask = wallCategory|monsterCategory|heroCategory
                self.node4.physicsBody?.usesPreciseCollisionDetection = true
                self.node4.xScale = 1
                self.node4.yScale = 1
                addChild(self.node4)
                
                //棚１
                self.shelf = SKSpriteNode(imageNamed:"shelf")
                self.shelf.position = CGPoint(x: frame.midX - 200, y: frame.midY - 150)
                self.shelf.physicsBody = SKPhysicsBody(rectangleOf: shelf.size)
                self.shelf.physicsBody?.affectedByGravity = false
                self.shelf.physicsBody?.isDynamic = false
                self.shelf.physicsBody?.categoryBitMask = shelfCategory
                self.shelf.physicsBody?.collisionBitMask = shelfCategory|monsterCategory|heroCategory
                self.shelf.physicsBody?.usesPreciseCollisionDetection = true
                self.shelf.xScale = 0.1
                self.shelf.yScale = 0.1
                //addChild(self.shelf)
                
                // left_buttonを画像登録して表示する
                self.left_button = SKSpriteNode(imageNamed: "left_button")
                self.left_button.position = CGPoint(x:frame.midX - 360 , y:frame.midY - 180)
                self.left_button.xScale = 0.30
                self.left_button.yScale = 0.30
                self.left_button.zPosition = 1
                addChild(self.left_button)
                
                // right_buttonを画像登録して表示する
                self.right_button = SKSpriteNode(imageNamed: "right_button")
                self.right_button.position = CGPoint(x:frame.midX-240, y:frame.midY-180)
                self.right_button.xScale = 0.30
                self.right_button.yScale = 0.30
                self.right_button.zPosition = 1
                addChild(self.right_button)
                
                // under_buttonを画像登録して表示する
                self.under_button = SKSpriteNode(imageNamed: "under_button")
                self.under_button.position = CGPoint(x:frame.midX - 300, y:frame.midY - 240)
                self.under_button.xScale = 0.30
                self.under_button.yScale = 0.30
                self.under_button.zPosition = 1
                addChild(self.under_button)
                
                // up_button を画像登録して表示する
                self.up_button = SKSpriteNode(imageNamed: "up_button")
                self.up_button.position = CGPoint(x:frame.midX - 300, y:frame.midY - 120)
                self.up_button.xScale = 0.30
                self.up_button.yScale = 0.30
                self.up_button.zPosition = 1
                addChild(self.up_button)
                
                
                self.monster2 = SKSpriteNode(imageNamed: "monster2")
                self.monster2.scale(to: CGSize(width: frame.width * 0.2, height: frame.width * 0.2))
                self.monster2.position = CGPoint(x: frame.midX + 500, y: frame.midY)
                self.monster2.physicsBody = SKPhysicsBody(circleOfRadius: self.monster2.frame.width * 0.2)
                self.monster2.physicsBody?.categoryBitMask = monsterCategory
                self.monster2.physicsBody?.contactTestBitMask = heroCategory
                self.monster2.physicsBody?.collisionBitMask = heroCategory|wallCategory|shelfCategory|monsterCategory
                self.monster2.physicsBody?.affectedByGravity = false
                self.monster2.physicsBody?.isDynamic = true
                self.monster2.physicsBody?.usesPreciseCollisionDetection = true
                addChild(self.monster2)
                
                self.shelf = SKSpriteNode(imageNamed: "shelf")
                self.shelf.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
                self.shelf.position = CGPoint(x:frame.midX, y:frame.midY)
                //addChild(self.shelf)
                
                self.shelf2 = SKSpriteNode(imageNamed: "shelf2")
                self.shelf2.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
                self.shelf2.position = CGPoint(x:frame.midX, y:frame.midY)
                //addChild(self.shelf2)
                
                self.Ladders = SKSpriteNode(imageNamed: "Ladders")
                self.Ladders.scale(to: CGSize(width: frame.width / 5, height: frame.width / 5))
                self.Ladders.position = CGPoint(x: frame.midX, y: frame.midY + 50)
                //addChild(self.Ladders)
                
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                    let moveToLeft = SKAction.move(to: CGPoint(x: self.hero.position.x, y: self.hero.position.y), duration: 3)
                    self.monster2.run(moveToLeft)
                })
                
                self.newmap = SKSpriteNode(imageNamed: "newmap")
                self.newmap.xScale = view.frame.size.width/self.newmap.size.width
                self.newmap.yScale = view.frame.size.height/self.newmap.size.height
                self.newmap.position = CGPoint(x: frame.midX, y: frame.midY)
                self.newmap.zPosition = -1.0
                addChild(self.newmap)
                
                
                self.hero = SKSpriteNode(imageNamed: "hero")
                self.hero.scale(to: CGSize(width: frame.width / 8, height: frame.width / 8))
                self.hero.position = CGPoint(x:frame.midX, y:frame.midY)
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
                        
                    }
                }
                
            }
            
            override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
                
            }
            
            func gameClear() {
                //ゲームを中断
                isPaused = true
                //タイマーを止める
                timer?.invalidate()
                timer2?.invalidate()
                //音を止める
                //FIXME
                
                //得点を保存する
                //FIXME
                //1秒後に画面を移動する
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    // ゲームクリアシーンに遷移させる。
                    let ud = UserDefaults.standard
                    ud.set(self.whatstage, forKey: "whatstage")
                    
                    
                    let newScene = GameClearScene(size: (self.scene?.size)!)
                    newScene.scaleMode = SKSceneScaleMode.aspectFill
                    self.view?.presentScene(newScene)
                }
            }
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
                    gameOver()
                }
            }
            func gameOver() {
                isPaused = true
                timer?.invalidate()
                timer2?.invalidate()
                //1秒後に画面を移動する
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    // げーム叔一母ーシーに遷移させる。
                    let newScene = GameOverScene(size: (self.scene?.size)!)
                    newScene.scaleMode = SKSceneScaleMode.aspectFill
                    self.view?.presentScene(newScene)
                }
                
                
            }
        }

                


        
