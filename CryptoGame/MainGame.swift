//
//  MainGame.swift
//  LifeBeats
//
//  Created by User on 1/4/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import SwiftUI
import SpriteKit
import Firebase
import GoogleMobileAds
import FirebaseAnalytics

class GameScene: SKScene
{
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
    let random = Int.random(in: 1...3)
   // let tutorial = UserDefaults.standard.bool(forKey: "gameTutoFinished") ?? true
    let background = SKSpriteNode(imageNamed: "Alto11")
    let background2 = SKSpriteNode(imageNamed: "Alto12")
    let background3 = SKSpriteNode(imageNamed: "Alto13")
    var rewardedAd: GADRewardedAd?
    let adDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    let background4 = SKSpriteNode(imageNamed: "Alto14")
    let background5 = SKSpriteNode(imageNamed: "Alto15")
    let background6 = SKSpriteNode(imageNamed: "Alto16")
    let background7 = SKSpriteNode(imageNamed: "Alto17")
    let background8 = SKSpriteNode(imageNamed: "Alto18")
    let background9 = SKSpriteNode(imageNamed: "Alto19")
    let background10 = SKSpriteNode(imageNamed: "Alto110")
    let background11 = SKSpriteNode(imageNamed: "Alto111")
    let background12 = SKSpriteNode(imageNamed: "Alto112")
    let background13 = SKSpriteNode(imageNamed: "Alto113")
    let background14 = SKSpriteNode(imageNamed: "Alto114")
    let background15 = SKSpriteNode(imageNamed: "Alto115")
    let background16 = SKSpriteNode(imageNamed: "Alto116")
    let background17 = SKSpriteNode(imageNamed: "Alto117")
    let heart = SKSpriteNode(imageNamed: "heart")
    
    let bg = SKSpriteNode(imageNamed: "City1")
    let bg2 = SKSpriteNode(imageNamed: "City2")
    let bg3 = SKSpriteNode(imageNamed: "City3")
    let bg4 = SKSpriteNode(imageNamed: "City4")
    let bg5 = SKSpriteNode(imageNamed: "City5")
    let bg6 = SKSpriteNode(imageNamed: "City6")
    let bg7 = SKSpriteNode(imageNamed: "City7")
    let bg8 = SKSpriteNode(imageNamed: "City8")
    let bg9 = SKSpriteNode(imageNamed: "City9")
    let bg10 = SKSpriteNode(imageNamed: "City10")
    let bg11 = SKSpriteNode(imageNamed: "City11")
    let bg12 = SKSpriteNode(imageNamed: "City12")
    let bg13 = SKSpriteNode(imageNamed: "City13")
    let bg14 = SKSpriteNode(imageNamed: "City14")
    let bg15 = SKSpriteNode(imageNamed: "City15")
    let bg16 = SKSpriteNode(imageNamed: "City16")
    let bg17 = SKSpriteNode(imageNamed: "City17")
    let bg18 = SKSpriteNode(imageNamed: "City18")
    
    let bga = SKSpriteNode(imageNamed: "Forest1")
    let bga2 = SKSpriteNode(imageNamed: "Forest2")
    let bga3 = SKSpriteNode(imageNamed: "Forest3")
    let bga4 = SKSpriteNode(imageNamed: "Forest4")
    let bga5 = SKSpriteNode(imageNamed: "Forest5")
    let bga6 = SKSpriteNode(imageNamed: "Forest6")
    let bga7 = SKSpriteNode(imageNamed: "Forest7")
    let bga8 = SKSpriteNode(imageNamed: "Forest8")
    let bga9 = SKSpriteNode(imageNamed: "Forest9")
    let bga10 = SKSpriteNode(imageNamed: "Forest10")
    let bga11 = SKSpriteNode(imageNamed: "Forest11")
    let bga12 = SKSpriteNode(imageNamed: "Forest12")
    let bga13 = SKSpriteNode(imageNamed: "Forest13")
    let bga14 = SKSpriteNode(imageNamed: "Forest14")
    let bga15 = SKSpriteNode(imageNamed: "Forest15")
    let bga16 = SKSpriteNode(imageNamed: "Forest16")
    let bga17 = SKSpriteNode(imageNamed: "Forest17")
    let bga18 = SKSpriteNode(imageNamed: "Forest18")
    let bga19 = SKSpriteNode(imageNamed: "Forest19")
    
    
    let label1 = SKLabelNode(fontNamed: "Nexa Bold")
    let label2 = SKLabelNode(fontNamed: "Nexa Bold")
    let label3 = SKLabelNode(fontNamed: "Nexa Bold")
    let label4 = SKLabelNode(fontNamed: "Nexa Bold")
    let label5 = SKLabelNode(fontNamed: "Nexa Bold")
    let gameOverLabel = SKSpriteNode(imageNamed: "GameOver")
    let rock = SKSpriteNode(imageNamed: "ROCK1")
    let box1 = SKSpriteNode(imageNamed: "Box1")
    let box2 = SKSpriteNode(imageNamed: "Box2")
    let coin = SKSpriteNode(imageNamed: "coin")
    let coin1 = SKSpriteNode(imageNamed: "coin")
    let coin2 = SKSpriteNode(imageNamed: "coin")
    let coin3 = SKSpriteNode(imageNamed: "coin")
    let lemon1 = SKSpriteNode(imageNamed: "LemonBubble")
    let lemon2 = SKSpriteNode(imageNamed: "LemonBubble")
    let logo1 = SKSpriteNode(imageNamed: "LifeCoin")
    let trashCan = SKSpriteNode(imageNamed: "TRASHCAN1")
    let update = SKSpriteNode(imageNamed: "gameUpdate")
    let myLabel = SKLabelNode(fontNamed: "Nexa Bold")
    let myLabel1 = SKLabelNode(fontNamed: "Nexa Bold")
    let myLabel2 = SKLabelNode(fontNamed: "Nexa Bold")
    let retry = SKLabelNode(fontNamed: "Nexa Bold")
    let livesLeft = SKLabelNode(fontNamed: "Nexa Bold")
    let adsForLives = SKLabelNode(fontNamed: "Nexa Bold")
    let  timeRemaining = SKLabelNode(fontNamed: "Nexa Bold")
    //var player = SKSpriteNode(imageNamed: "fococlipping-1")
  
    var MainGuy = SKSpriteNode()
    var JumpGuy = SKSpriteNode()
    var stop:Bool = UserDefaults.standard.bool(forKey: "gameTuto")
    var firstTime:Bool = UserDefaults.standard.bool(forKey: "gameTuto")
    var cam:SKCameraNode!
    var TextureAtLas = SKTextureAtlas()
    var TextureArray = [SKTexture]()
    var TextureArray1 = [SKTexture]()
    var coinAmount:Int = 0
    var startY:CGFloat = 0.0
    var count:Int = 0
    var adOn:Int = 0
    var lives:Int = GlobalPlayer.sharedInstance.gameLives
    //UserDefaults.standard.integer(forKey:"Lives")
    var stopCounting: Bool = false
    var firstStart: Bool = true
    var difficulty = Int.random(in: 1...2)
    var duration:TimeInterval = GlobalPlayer.sharedInstance.timeTilLife
       
    override func didMove(to view: SKView) {
        

        
        TextureAtLas = SKTextureAtlas(named: "images")
        
        for i in 1...TextureAtLas.textureNames.count
        {
            var name = "BoyCharacter\(i)"
            TextureArray.append(SKTexture(imageNamed: name))
            
        }
        
//        for i in 1...TextureAtLas.textureNames.count-2
//        {
//            var name1 = "HorseJumpLoop\(i)"
//            TextureArray1.append(SKTexture(imageNamed: name1))
//        }
        
//        JumpGuy = SKSpriteNode(imageNamed: TextureAtLas.textureNames[2])
//        JumpGuy.size = CGSize(width: 100, height: 90)
//        JumpGuy.position = CGPoint(x: size.width / 2, y: size.height / 10)
//        JumpGuy.zPosition = -6
//        self.addChild(JumpGuy)
//        self.startY = JumpGuy.position.y
//        JumpGuy.run(SKAction.repeatForever(SKAction.animate(with: TextureArray1, timePerFrame: 0.1)))
        //JumpGuy.run(SKAction.)
        
        MainGuy = SKSpriteNode(imageNamed: TextureAtLas.textureNames[0])
        MainGuy.size = CGSize(width: 55, height: 90)
        if(random ==  2 || random == 3)
        {
        MainGuy.position = CGPoint(x: size.width / 2, y: size.height / 10 )
        }
        else
        {
        MainGuy.position = CGPoint(x: size.width / 2, y: size.height / 10)
        }
        MainGuy.zPosition = 5
        self.addChild(MainGuy)
        self.startY = MainGuy.position.y
        MainGuy.run(SKAction.repeatForever(SKAction.animate(with: TextureArray, timePerFrame: 0.1)))
        
        
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        background.size = self.size
        if(random == 1)
        {
        background.zPosition = 1
        }
        else
        {
            background.zPosition = -3
        }
        addChild(background)
        
        background2.anchorPoint = CGPoint.zero
        background2.position.y = 0
        background2.position.x = background.size.width - 1
        if(random == 1)
        {
        background2.zPosition = 1
        }
        else
        {
            background2.zPosition = -3
        }
        background2.size = self.size
        addChild(background2)
        
        background3.anchorPoint = CGPoint.zero
        background3.position.y = 0
        background3.position.x = background.size.width+background2.size.width - 1
        if(random == 1)
        {
            background3.zPosition = 1
            
        }
        else
        {
            background3.zPosition = -3
        }
        background3.size = self.size
        addChild(background3)
        
        background4.anchorPoint = CGPoint.zero
        background4.position.y = 0
        background4.position.x = background.size.width+background2.size.width+background3.size.width - 1
        if(random == 1)
        {
        background4.zPosition = 1
        }
        else
        {
            background4.zPosition = -3
        }
        background4.size = self.size
        addChild(background4)
        
        background5.anchorPoint = CGPoint.zero
        background5.position.y = 0
        background5.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width - 1
        if(random == 1)
        {
        background5.zPosition = 1
        }
        else
        {
            background5.zPosition = -3
        }
        background5.size = self.size
        addChild(background5)
        
        background6.anchorPoint = CGPoint.zero
        background6.position.y = 0
        background6.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width - 1
        if(random == 1)
        {
        background6.zPosition = 1
        }
        else
        {
            background6.zPosition = -3
        }
        background6.size = self.size
        addChild(background6)
        
        background7.anchorPoint = CGPoint.zero
        background7.position.y = 0
        background7.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width - 1
        if(random == 1)
        {
        background7.zPosition = 1
        }
        else
        {
            background7.zPosition = -3
        }
        background7.size = self.size
        addChild(background7)
        
        background8.anchorPoint = CGPoint.zero
        background8.position.y = 0
        background8.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width - 1
        if(random == 1)
        {
        background8.zPosition = 1
        }
        else
        {
            background8.zPosition = -3
        }
        background8.size = self.size
        addChild(background8)
        
        background9.anchorPoint = CGPoint.zero
        background9.position.y = 0
        background9.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width - 1
        if(random == 1)
        {
        background9.zPosition = 1
        }
        else
        {
            background9.zPosition = -3
        }
        background9.size = self.size
        addChild(background9)
        
        background10.anchorPoint = CGPoint.zero
        background10.position.y = 0
        background10.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width - 1
        if(random == 1)
        {
        background10.zPosition = 1
        }
        else
        {
            background10.zPosition = -3
        }
        background10.size = self.size
        addChild(background10)
        
        background11.anchorPoint = CGPoint.zero
        background11.position.y = 0
        background11.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width - 1
        if(random == 1)
        {
        background11.zPosition = 1
        }
        else
        {
            background11.zPosition = -3
        }
        background11.size = self.size
        addChild(background11)
        
        background12.anchorPoint = CGPoint.zero
        background12.position.y = 0
        background12.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width - 1
        if(random == 1)
        {
        background12.zPosition = 1
        }
        else
        {
            background12.zPosition = -3
        }
        background12.size = self.size
        addChild(background12)
        
        background13.anchorPoint = CGPoint.zero
        background13.position.y = 0
        background13.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width - 1
        if(random == 1)
        {
        background13.zPosition = 1
        }
        else
        {
            background13.zPosition = -3
        }
        background13.size = self.size
        addChild(background13)
        
        background14.anchorPoint = CGPoint.zero
        background14.position.y = 0
        background14.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width+background13.size.width - 1
        if(random == 1)
        {
        background14.zPosition = 1
        }
        else
        {
            background14.zPosition = -3
        }
        background14.size = self.size
        addChild(background14)
        
        background15.anchorPoint = CGPoint.zero
        background15.position.y = 0
        background15.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width+background13.size.width+background14.size.width - 1
        if(random == 1)
        {
        background15.zPosition = 1
        }
        background15.size = self.size
        addChild(background15)
        
        background16.anchorPoint = CGPoint.zero
        background16.position.y = 0
        background16.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width+background13.size.width+background14.size.width+background15.size.width - 1
        if(random == 1)
        {
        background16.zPosition = 1
        }
        else
        {
            background16.zPosition = -3
        }
        background16.size = self.size
        addChild(background16)
        
        background17.anchorPoint = CGPoint.zero
        background17.position.y = 0
        background17.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width+background13.size.width+background14.size.width+background15.size.width+background16.size.width - 5
        if(random == 1)
        {
        background17.zPosition = 1
        }
        else
        {
            background17.zPosition = -3
        }
        background17.size = self.size
        addChild(background17)
        
        label1.text = "-Tap to jump"
        label1.zPosition = 2
        label1.fontSize = 18
        label1.fontColor = UIColor.black
        label1.position.y = (size.height/2)+75
        label1.position.x = size.width/2
        addChild(label1)
        label2.text = "-Collect coins"
        label2.zPosition = 2
        label2.fontSize = 18
        label2.fontColor = UIColor.black
        label2.position.y = (size.height/2)+50
        label2.position.x = size.width/2
        addChild(label2)
        label3.text = "-Avoid obstacles"
        label3.zPosition = 2
        label3.fontSize = 18
        label3.fontColor = UIColor.black
        label3.position.y = (size.height/2)+25
        label3.position.x = size.width/2
        addChild(label3)
        label4.text = "-Coins collected can be exchanged later"
        label4.zPosition = 2
        label4.fontSize = 15
        label4.fontColor = UIColor.black
        label4.position.y = size.height/2
        label4.position.x = size.width/2
        addChild(label4)
        label5.text = "for cryptocurrency once launched"
        label5.zPosition = 2
        label5.fontSize = 15
        label5.fontColor = UIColor.black
        label5.position.y = (size.height/2)-25
        label5.position.x = size.width/2
        addChild(label5)
        
//        background5.anchorPoint = CGPoint.zero
//        background5.position.y = 0
//        background5.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width - 5
//        background5.zPosition = 1
//        background5.size = self.size
//        addChild(background5)
        
        
        bg.anchorPoint = CGPoint.zero
        bg.position = CGPoint.zero
        bg.size = self.size
        if(random == 2)
        {
            bg.zPosition = 1
        }
        else
        {
        bg.zPosition = -1
        }
        addChild(bg)
        
        bg2.anchorPoint = CGPoint.zero
        bg2.position.y = 0
        bg2.position.x = bg.size.width - 1
        if(random == 2)
        {
            bg2.zPosition = 1
        }
        else
        {
        bg2.zPosition = -1
        }
        bg2.size = self.size
        addChild(bg2)
        
        bg3.anchorPoint = CGPoint.zero
        bg3.position.y = 0
        bg3.position.x = bg.size.width+bg2.size.width - 1
        if(random == 2)
        {
            bg3.zPosition = 1
        }
        else
        {
        bg3.zPosition = -1
        }
        bg3.size = self.size
        addChild(bg3)
        
        bg4.anchorPoint = CGPoint.zero
        bg4.position.y = 0
        bg4.position.x = bg.size.width+bg2.size.width+bg3.size.width - 1
        if(random == 2)
        {
            bg4.zPosition = 1
        }
        else
        {
        bg4.zPosition = -1
        }
        bg4.size = self.size
        addChild(bg4)
        
        bg5.anchorPoint = CGPoint.zero
        bg5.position.y = 0
        bg5.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width - 1
        if(random == 2)
        {
            bg5.zPosition = 1
        }
        else
        {
        bg5.zPosition = -1
        }
        bg5.size = self.size
        addChild(bg5)
        
        bg6.anchorPoint = CGPoint.zero
        bg6.position.y = 0
        bg6.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width - 1
        if(random == 2)
        {
            bg6.zPosition = 1
        }
        else
        {
        bg6.zPosition = -1
        }
        bg6.size = self.size
        addChild(bg6)
        
        bg7.anchorPoint = CGPoint.zero
        bg7.position.y = 0
        bg7.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width - 1
        if(random == 2)
        {
            bg7.zPosition = 1
        }
        else
        {
        bg7.zPosition = -1
        }
            bg7.size = self.size
        addChild(bg7)
        
        bg8.anchorPoint = CGPoint.zero
        bg8.position.y = 0
        bg8.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width - 1
        if(random == 2)
        {
            bg8.zPosition = 1
        }
        else
        {
        bg8.zPosition = -1
        }
        bg8.size = self.size
        addChild(bg8)
        
        bg9.anchorPoint = CGPoint.zero
        bg9.position.y = 0
        bg9.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width - 1
        if(random == 2)
        {
            bg9.zPosition = 1
        }
        else
        {
        bg9.zPosition = -1
        }
        bg9.size = self.size
        addChild(bg9)
        
        bg10.anchorPoint = CGPoint.zero
        bg10.position.y = 0
        bg10.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width - 1
        if(random == 2)
        {
            bg10.zPosition = 1
        }
        else
        {
        bg10.zPosition = -1
        }
        bg10.size = self.size
        addChild(bg10)
        
        bg11.anchorPoint = CGPoint.zero
        bg11.position.y = 0
        bg11.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width - 1
        if(random == 2)
        {
            bg11.zPosition = 1
        }
        else
        {
        bg11.zPosition = -1
        }
        bg11.size = self.size
        addChild(bg11)
        
        bg12.anchorPoint = CGPoint.zero
        bg12.position.y = 0
        bg12.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width - 1
        if(random == 2)
        {
            bg12.zPosition = 1
        }
        else
        {
        bg12.zPosition = -1
        }
        bg12.size = self.size
        addChild(bg12)
        
        bg13.anchorPoint = CGPoint.zero
        bg13.position.y = 0
        bg13.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width - 1
        if(random == 2)
        {
            bg13.zPosition = 1
        }
        else
        {
        bg13.zPosition = -1
        }
        bg13.size = self.size
        addChild(bg13)
        
        bg14.anchorPoint = CGPoint.zero
        bg14.position.y = 0
        bg14.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width - 1
        if(random == 2)
        {
            bg14.zPosition = 1
        }
        else
        {
        bg14.zPosition = -1
        }
        bg14.size = self.size
        addChild(bg14)
        
        bg15.anchorPoint = CGPoint.zero
        bg15.position.y = 0
        bg15.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width+bg14.size.width - 1
        if(random == 2)
        {
            bg15.zPosition = 1
        }
        else
        {
        bg15.zPosition = -1
        }
        bg15.size = self.size
        addChild(bg15)
        
        bg16.anchorPoint = CGPoint.zero
        bg16.position.y = 0
        bg16.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width+bg14.size.width+bg15.size.width - 1
        if(random == 2)
        {
            bg16.zPosition = 1
        }
        else
        {
        bg16.zPosition = -1
        }
        bg16.size = self.size
        addChild(bg16)
        
        bg17.anchorPoint = CGPoint.zero
        bg17.position.y = 0
        bg17.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width+bg14.size.width+bg15.size.width+bg16.size.width - 1
        if(random == 2)
        {
            bg17.zPosition = 1
        }
        else
        {
        bg17.zPosition = -1
        }
        bg17.size = self.size
        addChild(bg17)
        
        bg18.anchorPoint = CGPoint.zero
        bg18.position.y = 0
        bg18.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width+bg14.size.width+bg15.size.width+bg16.size.width+bg17.size.width - 5
        if(random == 2)
        {
            bg18.zPosition = 1
        }
        else
        {
        bg18.zPosition = -1
        }
        bg18.size = self.size
        addChild(bg18)
        
        //add -5 at last
        
        bga.anchorPoint = CGPoint.zero
        bga.position = CGPoint.zero
        bga.size = self.size
        if(random == 3)
        {
            bga.zPosition = 1
        }
        else
        {
        bga.zPosition = -2
        }
        addChild(bga)
        
        bga2.anchorPoint = CGPoint.zero
        bga2.position.y = 0
        bga2.position.x = bga.size.width - 1
        if(random == 3)
        {
            bga2.zPosition = 1
        }
        else
        {
        bga2.zPosition = -2
        }
        bga2.size = self.size
        addChild(bga2)
        
        bga3.anchorPoint = CGPoint.zero
        bga3.position.y = 0
        bga3.position.x = bga.size.width+bga2.size.width - 1
        if(random == 3)
        {
            bga3.zPosition = 1
        }
        else
        {
        bga3.zPosition = -2
        }
        bga3.size = self.size
        addChild(bga3)
        
        bga4.anchorPoint = CGPoint.zero
        bga4.position.y = 0
        bga4.position.x = bga.size.width+bga2.size.width+bga3.size.width - 1
        if(random == 3)
        {
            bga4.zPosition = 1
        }
        else
        {
        bga4.zPosition = -2
        }
        bga4.size = self.size
        addChild(bga4)
        
        bga5.anchorPoint = CGPoint.zero
        bga5.position.y = 0
        bga5.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width - 1
        if(random == 3)
        {
            bga5.zPosition = 1
        }
        else
        {
        bga5.zPosition = -2
        }
        bga5.size = self.size
        addChild(bga5)
        
        bga6.anchorPoint = CGPoint.zero
        bga6.position.y = 0
        bga6.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width - 1
        if(random == 3)
        {
            bga6.zPosition = 1
        }
        else
        {
        bga6.zPosition = -2
        }
        bga6.size = self.size
        addChild(bga6)
        
        bga7.anchorPoint = CGPoint.zero
        bga7.position.y = 0
        bga7.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width - 1
        if(random == 3)
        {
            bga7.zPosition = 1
        }
        else
        {
        bga7.zPosition = -2
        }
        bga7.size = self.size
        addChild(bga7)
        
        bga8.anchorPoint = CGPoint.zero
        bga8.position.y = 0
        bga8.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width - 1
        if(random == 3)
        {
            bga8.zPosition = 1
        }
        else
        {
        bga8.zPosition = -2
        }
        bga8.size = self.size
        addChild(bga8)
        
        bga9.anchorPoint = CGPoint.zero
        bga9.position.y = 0
        bga9.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width - 1
        if(random == 3)
        {
            bga9.zPosition = 1
        }
        else
        {
        bga9.zPosition = -2
        }
        bga9.size = self.size
        addChild(bga9)
        
        bga10.anchorPoint = CGPoint.zero
        bga10.position.y = 0
        bga10.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width - 1
        if(random == 3)
        {
            bga10.zPosition = 1
        }
        else
        {
        bga10.zPosition = -2
        }
        bga10.size = self.size
        addChild(bga10)
        
        bga11.anchorPoint = CGPoint.zero
        bga11.position.y = 0
        bga11.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width - 1
        if(random == 3)
        {
            bga11.zPosition = 1
        }
        else
        {
        bga11.zPosition = -2
        }
        bga11.size = self.size
        addChild(bga11)
        
        bga12.anchorPoint = CGPoint.zero
        bga12.position.y = 0
        bga12.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width - 1
        if(random == 3)
        {
            bga12.zPosition = 1
        }
        else
        {
        bga12.zPosition = -2
        }
        bga12.size = self.size
        addChild(bga12)
        
        bga13.anchorPoint = CGPoint.zero
        bga13.position.y = 0
        bga13.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width - 1
        if(random == 3)
        {
            bga13.zPosition = 1
        }
        else
        {
        bga13.zPosition = -2
        }
        bga13.size = self.size
        addChild(bga13)
        
        bga14.anchorPoint = CGPoint.zero
        bga14.position.y = 0
        bga14.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width - 1
        if(random == 3)
        {
            bga14.zPosition = 1
        }
        else
        {
        bga14.zPosition = -2
        }
        bga14.size = self.size
        addChild(bga14)
        
        bga15.anchorPoint = CGPoint.zero
        bga15.position.y = 0
        bga15.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width - 1
        if(random == 3)
        {
            bga15.zPosition = 1
        }
        else
        {
        bga15.zPosition = -2
        }
        bga15.size = self.size
        addChild(bga15)
        
        bga16.anchorPoint = CGPoint.zero
        bga16.position.y = 0
        bga16.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width+bga15.size.width - 1
        if(random == 3)
        {
            bga16.zPosition = 1
        }
        else
        {
        bga16.zPosition = -2
        }
        bga16.size = self.size
        addChild(bga16)
        
        bga17.anchorPoint = CGPoint.zero
        bga17.position.y = 0
        bga17.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width+bga15.size.width+bga16.size.width - 1
        if(random == 3)
        {
            bga17.zPosition = 1
        }
        else
        {
        bga17.zPosition = -2
        }
        bga17.size = self.size
        addChild(bga17)
        
        bga18.anchorPoint = CGPoint.zero
        bga18.position.y = 0
        bga18.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width+bga15.size.width+bga16.size.width+bga17.size.width - 1
        if(random == 3)
        {
            bga18.zPosition = 1
        }
        else
        {
        bga18.zPosition = -2
        }
        bga18.size = self.size
        addChild(bga18)
        
        bga19.anchorPoint = CGPoint.zero
        bga19.position.y = 0
        bga19.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width+bga15.size.width+bga16.size.width+bga17.size.width+bga18.size.width - 5
        if(random == 3)
        {
            bga19.zPosition = 1
        }
        else
        {
        bga19.zPosition = -2
        }
        bga19.size = self.size
        addChild(bga19)
        
        //add -5 at last
        
        
        gameOverLabel.anchorPoint = CGPoint.zero
        gameOverLabel.position.y = size.height/2
        gameOverLabel.position.x = size.width/4
        gameOverLabel.zPosition = -1
        gameOverLabel.size = CGSize(width: 200, height: 100)
        addChild(gameOverLabel)
        
//        update.anchorPoint = CGPoint.zero
//        update.position.y = size.height/2-300
//        update.position.x = size.width/6
//        update.zPosition = 10
//        update.size = CGSize(width: 300, height: 600)
//        addChild(update)
        
        
        retry.text = "Tap to Retry";
        retry.fontSize = 35
        retry.name = "tapToRetry"
        retry.position.y = size.height/2 - 70
        retry.position.x = size.width/2
        retry.zPosition = -1
        retry.fontColor = UIColor.black
        addChild(retry)
        
        livesLeft.text = "\(String(self.lives)) lives left";
        livesLeft.fontSize = 16
        livesLeft.position.y = size.height/2 - 100
        livesLeft.position.x = size.width/2
        livesLeft.zPosition = -1
        livesLeft.fontColor = UIColor.black
        addChild(livesLeft)
        
        adsForLives.text = "Watch ads (wait few seconds)";
        adsForLives.fontSize = 25
        adsForLives.name = "adsForLives"
        adsForLives.position.y = size.height/2 - 150
        adsForLives.position.x = size.width/2
        if(self.lives == 0)
        {
        adsForLives.zPosition = 3
        }
        else
        {
        adsForLives.zPosition = -1
        }
        adsForLives.fontColor = UIColor.blue
        addChild(adsForLives)
        
        box1.anchorPoint = CGPoint.zero
        box1.position.y = (size.height/10)-20
        box1.position.x = size.width-50.5
        box1.zPosition = 3
        box1.size = CGSize(width: 30, height: 30)
        addChild(box1)

        rock.anchorPoint = CGPoint.zero
        rock.position.y = (size.height/10)-20
        rock.position.x = size.width/2-50.5
        rock.zPosition = -3
        rock.size = CGSize(width: 30, height: 30)
        addChild(rock)
        
        coin.anchorPoint = CGPoint.zero
        coin.position.y = (size.height/10)-20
        coin.position.x = size.width-150.5
        coin.zPosition = 3
        coin.size = CGSize(width: 15, height: 15)
        addChild(coin)
        
        coin1.anchorPoint = CGPoint.zero
        coin1.position.y = (size.height/10)-20
        coin1.position.x = size.width-80.5
        coin1.zPosition = 3
        coin1.size = CGSize(width: 15, height: 15)
        addChild(coin1)
        
        coin2.anchorPoint = CGPoint.zero
        coin2.position.y = (size.height/10)-20
        coin2.position.x = size.width-60.5
        coin2.zPosition = 3
        coin2.size = CGSize(width: 15, height: 15)
        addChild(coin2)
        
        coin3.anchorPoint = CGPoint.zero
        coin3.position.y = (size.height/10)-20
        coin3.position.x = size.width-40.5
        coin3.zPosition = 3
        coin3.size = CGSize(width: 15, height: 15)
        addChild(coin3)
        
        trashCan.anchorPoint = CGPoint.zero
        trashCan.position.y = (size.height/10)-20
        trashCan.position.x = size.width/3-50.5
        trashCan.zPosition = 3
        trashCan.size = CGSize(width: 30, height: 30)
        addChild(trashCan)
        
        lemon1.anchorPoint = CGPoint.zero
        lemon1.position.y = size.height-108
        lemon1.position.x = size.width-80
        lemon1.zPosition = 1
        lemon1.size = CGSize(width: 78, height: 40)
        addChild(lemon1)
        
        lemon2.anchorPoint = CGPoint.zero
        lemon2.position.y = size.height-108
        lemon2.position.x = size.width-168
        lemon2.zPosition = 1
        lemon2.size = CGSize(width: 75, height: 40)
        addChild(lemon2)
        
        heart.anchorPoint = CGPoint.zero
        heart.position.y = size.height-108
        heart.position.x = size.width-98
        heart.zPosition = 2
        heart.size = CGSize(width: 40, height: 40)
        addChild(heart)
        
        myLabel2.text = "\(String(self.lives))";
        myLabel2.fontSize = 16
        myLabel2.position.y = size.height-95
        myLabel2.position.x = size.width-55
        myLabel2.zPosition = 2
        myLabel2.fontColor = UIColor.black
        addChild(myLabel2)
        
        timeRemaining.text = "0:00";
        timeRemaining.fontSize = 12
        timeRemaining.position.y = size.height-95
        timeRemaining.position.x = size.width-30
        timeRemaining.zPosition = 2
        timeRemaining.fontColor = UIColor.black
        addChild(timeRemaining)
        
        
        
//        myLabel1.text = "Coins";
//        myLabel1.fontSize = 20
//        myLabel1.position.y = size.height-95
//        myLabel1.position.x = size.width-150
//        myLabel1.zPosition = 2
//        myLabel1.fontColor = UIColor.black
//        addChild(myLabel1)
        
        logo1.anchorPoint = CGPoint.zero
        logo1.position.y = size.height-108
        logo1.position.x = size.width-178
        logo1.zPosition = 2
        logo1.size = CGSize(width: 40, height: 40)
        addChild(logo1)
        
        myLabel.text = "0";
        myLabel.fontSize = 16
        myLabel.position.y = size.height-95
        myLabel.position.x = size.width-120
        myLabel.zPosition = 2
        myLabel.fontColor = UIColor.black
        addChild(myLabel)
//        player.position = CGPoint(x: size.width / 2, y: size.height / 10)
//        player.zPosition = 5
//        player.size = CGSize(width: 100, height: 90)
//        player.run(SKAction.moveTo(x: 900, duration: 60))
//        addChild(player)
        
        cam = SKCameraNode()
        cam.zPosition = 10
        cam.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(cam)
        
        camera = cam
        

        
    }
    
    
    func timeString(time:TimeInterval)
    {
        //let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        self.timeRemaining.text = String(format:"%02i:%02i", minutes, seconds)
    }
    
    func timeCheck()
    {
//
//        let calendar = Calendar.current
//        let date = Date()
//        let components = calendar.dateComponents(
//            [.hour, .minute, .second, .nanosecond],
//            from: date
//        )
//        let tomorrow = calendar.nextDate(
//            after: date,
//            matching: components,
//            matchingPolicy: .nextTime
//        )
//        let yesterday = calendar.nextDate(
//            after: date,
//            matching: components,
//            matchingPolicy: .nextTime,
//            direction: .backward
//        )
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        let result = formatter.string(from: tomorrow!)
//        let result1 = formatter.string(from: date)
//        let result2 = formatter.string(from: yesterday!)
//
//        let hour = components.hour
//        let minutes =  components.minute
        
        if let date = UserDefaults.standard.object(forKey: "creationTime") as? Date {
            if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 1 {
                if(self.lives < 5)
                {
                    
                }
            }
            if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 2 {
                //do something
            }
            if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 3 {
                //do something
            }
            if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 4 {
                //do something
            }
            if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 5 {
                //do something
            }
        }
        
    }
    
    func ads()
    {
        self.rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-2549645746750255/7262967641")
        self.rewardedAd?.load(GADRequest()) { error in
            if let error = error {
              // Handle ad failed to load case.
                print(error)
            } else {
                if self.rewardedAd?.isReady == true {
                    let root = UIApplication.shared.windows.first?.rootViewController
                    self.rewardedAd?.present(fromRootViewController: root!, delegate: self.adDelegate)
                }
            }
          }
    }
    
    func backInPlace()
    {
        
        let r = Int.random(in: 1...3)
        
        MainGuy.position = CGPoint(x: size.width / 2, y: size.height / 10)
        
        self.coinAmount = 0
        myLabel.text = String(self.coinAmount)
        
        if(r == 1)
        {


            
            background.zPosition = 1
            background2.zPosition = 1
            background3.zPosition = 1
            background4.zPosition = 1
            background5.zPosition = 1
            background6.zPosition = 1
            background7.zPosition = 1
            background8.zPosition = 1
            background9.zPosition = 1
            background10.zPosition = 1
            background11.zPosition = 1
            background12.zPosition = 1
            background13.zPosition = 1
            background14.zPosition = 1
            background15.zPosition = 1
            background16.zPosition = 1
            background17.zPosition = 1
            bg.zPosition = -1
            bg2.zPosition = -1
            bg3.zPosition = -1
            bg4.zPosition = -1
            bg5.zPosition = -1
            bg6.zPosition = -1
            bg7.zPosition = -1
            bg8.zPosition = -1
            bg9.zPosition = -1
            bg10.zPosition = -1
            bg11.zPosition = -1
            bg12.zPosition = -1
            bg13.zPosition = -1
            bg14.zPosition = -1
            bg15.zPosition = -1
            bg16.zPosition = -1
            bg17.zPosition = -1
            bg18.zPosition = -1
            bga.zPosition = -2
            bga2.zPosition = -2
            bga3.zPosition = -2
            bga4.zPosition = -2
            bga5.zPosition = -2
            bga6.zPosition = -2
            bga7.zPosition = -2
            bga8.zPosition = -2
            bga9.zPosition = -2
            bga10.zPosition = -2
            bga11.zPosition = -2
            bga12.zPosition = -2
            bga13.zPosition = -2
            bga14.zPosition = -2
            bga15.zPosition = -2
            bga16.zPosition = -2
            bga17.zPosition = -2
            bga18.zPosition = -2
            bga19.zPosition = -2
        }
        else if(r == 2)
        {
            

            
            background.zPosition = -3
            background2.zPosition = -3
            background3.zPosition = -3
            background4.zPosition = -3
            background5.zPosition = -3
            background6.zPosition = -3
            background7.zPosition = -3
            background8.zPosition = -3
            background9.zPosition = -3
            background10.zPosition = -3
            background11.zPosition = -3
            background12.zPosition = -3
            background13.zPosition = -3
            background14.zPosition = -3
            background15.zPosition = -3
            background16.zPosition = -3
            background17.zPosition = -3
            bg.zPosition = 1
            bg2.zPosition = 1
            bg3.zPosition = 1
            bg4.zPosition = 1
            bg5.zPosition = 1
            bg6.zPosition = 1
            bg7.zPosition = 1
            bg8.zPosition = 1
            bg9.zPosition = 1
            bg10.zPosition = 1
            bg11.zPosition = 1
            bg12.zPosition = 1
            bg13.zPosition = 1
            bg14.zPosition = 1
            bg15.zPosition = 1
            bg16.zPosition = 1
            bg17.zPosition = 1
            bg18.zPosition = 1
            bga.zPosition = -2
            bga2.zPosition = -2
            bga3.zPosition = -2
            bga4.zPosition = -2
            bga5.zPosition = -2
            bga6.zPosition = -2
            bga7.zPosition = -2
            bga8.zPosition = -2
            bga9.zPosition = -2
            bga10.zPosition = -2
            bga11.zPosition = -2
            bga12.zPosition = -2
            bga13.zPosition = -2
            bga14.zPosition = -2
            bga15.zPosition = -2
            bga16.zPosition = -2
            bga17.zPosition = -2
            bga18.zPosition = -2
            bga19.zPosition = -2
        }
        else if(r == 3)
        {


            background.zPosition = -3
            background2.zPosition = -3
            background3.zPosition = -3
            background4.zPosition = -3
            background5.zPosition = -3
            background6.zPosition = -3
            background7.zPosition = -3
            background8.zPosition = -3
            background9.zPosition = -3
            background10.zPosition = -3
            background11.zPosition = -3
            background12.zPosition = -3
            background13.zPosition = -3
            background14.zPosition = -3
            background15.zPosition = -3
            background16.zPosition = -3
            background17.zPosition = -3
            bg.zPosition = -1
            bg2.zPosition = -1
            bg3.zPosition = -1
            bg4.zPosition = -1
            bg5.zPosition = -1
            bg6.zPosition = -1
            bg7.zPosition = -1
            bg8.zPosition = -1
            bg9.zPosition = -1
            bg10.zPosition = -1
            bg11.zPosition = -1
            bg12.zPosition = -1
            bg13.zPosition = -1
            bg14.zPosition = -1
            bg15.zPosition = -1
            bg16.zPosition = -1
            bg17.zPosition = -1
            bg18.zPosition = -1
            bga.zPosition = 1
            bga2.zPosition = 1
            bga3.zPosition = 1
            bga4.zPosition = 1
            bga5.zPosition = 1
            bga6.zPosition = 1
            bga7.zPosition = 1
            bga8.zPosition = 1
            bga9.zPosition = 1
            bga10.zPosition = 1
            bga11.zPosition = 1
            bga12.zPosition = 1
            bga13.zPosition = 1
            bga14.zPosition = 1
            bga15.zPosition = 1
            bga16.zPosition = 1
            bga17.zPosition = 1
            bga18.zPosition = 1
            bga19.zPosition = 1
        }
        
        
        background.position = CGPoint.zero
        
        background2.position.x = background.size.width - 1
        background3.position.x = background.size.width+background2.size.width - 1
        background4.position.x = background.size.width+background2.size.width+background3.size.width - 1
        background5.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width - 1
        background6.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width - 1
        background7.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width - 1
        background8.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width - 1
        background9.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width - 1
        background10.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width - 1
        background11.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width - 1
        background12.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width - 1
        background13.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width - 1
        background14.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width+background13.size.width - 1
        background15.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width+background13.size.width+background14.size.width - 1
        background16.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width+background13.size.width+background14.size.width+background15.size.width - 1
        background17.position.x = background.size.width+background2.size.width+background3.size.width+background4.size.width+background5.size.width+background6.size.width+background7.size.width+background8.size.width+background9.size.width+background10.size.width+background11.size.width+background12.size.width+background13.size.width+background14.size.width+background15.size.width+background16.size.width - 5
        
        bg.position = CGPoint.zero
        bg2.position.x = bg.size.width - 1
        bg3.position.x = bg.size.width+bg2.size.width - 1
        bg4.position.x = bg.size.width+bg2.size.width+bg3.size.width - 1
        bg5.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width - 1
        bg6.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width - 1
        bg7.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width - 1
        bg8.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width - 1
        bg9.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width - 1
        bg10.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width - 1
        bg11.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width - 1
        bg12.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width - 1
        bg13.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width - 1
        bg14.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width - 1
        bg15.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width+bg14.size.width - 1
        bg16.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width+bg14.size.width+bg15.size.width - 1
        bg17.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width+bg14.size.width+bg15.size.width+bg16.size.width - 1
        bg18.position.x = bg.size.width+bg2.size.width+bg3.size.width+bg4.size.width+bg5.size.width+bg6.size.width+bg7.size.width+bg8.size.width+bg9.size.width+bg10.size.width+bg11.size.width+bg12.size.width+bg13.size.width+bg14.size.width+bg15.size.width+bg16.size.width+bg17.size.width - 5
        
        bga.position = CGPoint.zero
        bga2.position.x = bga.size.width - 1
        bga3.position.x = bga.size.width+bga2.size.width - 1
        bga4.position.x = bga.size.width+bga2.size.width+bga3.size.width - 1
        bga5.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width - 1
        bga6.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width - 1
        bga7.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width - 1
        bga8.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width - 1
        bga9.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width - 1
        bga10.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width - 1
        bga11.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width - 1
        bga12.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width - 1
        bga13.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width - 1
        bga14.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width - 1
        bga15.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width - 1
        bga16.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width+bga15.size.width - 1
        bga17.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width+bga15.size.width+bga16.size.width - 1
        bga18.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width+bga15.size.width+bga16.size.width+bga17.size.width - 1
        bga19.position.x = bga.size.width+bga2.size.width+bga3.size.width+bga4.size.width+bga5.size.width+bga6.size.width+bga7.size.width+bga8.size.width+bga9.size.width+bga10.size.width+bga11.size.width+bga12.size.width+bga13.size.width+bga14.size.width+bga15.size.width+bga16.size.width+bga17.size.width+bga18.size.width - 5
        
        
        box1.position.x = size.width-50.5
        rock.position.x = size.width/2-50.5
        trashCan.position.x = size.width/3-50.5
        coin.position.x = size.width-150.5
        coin1.position.x = size.width-80.5
        coin2.position.x = size.width-60.5
        coin3.position.x = size.width-40.5
        
        
        box1.position.y = (size.height/10)-20
        rock.position.y = (size.height/10)-20
        trashCan.position.y = (size.height/10)-20
        coin.position.y = (size.height/10)-20
        coin1.position.y = (size.height/10)-20
        coin2.position.y = (size.height/10)-20
        coin3.position.y = (size.height/10)-20
        
        self.stop = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches
//        {
//            player.position = CGPoint(x: player.position.x, y: player.position.y + 80)
//
//
//            _ = Timer(timeInterval: 1, repeats: false) { _ in             self.player.position = CGPoint(x: self.player.position.x, y: self.player.position.y - 80)  }
//
//            let location = touch.location(in: self)
//
//        }
        
        for touch in touches {
                    let location = touch.location(in: self)
                    let touchedNode = atPoint(location)
                    if touchedNode.name == "adsForLives" {
                        self.ads()
                        //self.adOn = 1
                        self.stop = true
                        self.livesLeft.zPosition = -1
                        self.retry.zPosition = -1
                        self.adOn = 1
                        if(self.lives < 5)
                        {
                            //if(self.adOn == 0)
                           // {
                            self.lives = self.lives + 1
                            myLabel2.text = String(self.lives)
                            livesLeft.text = "\(String(self.lives)) lives left"
                            UserDefaults.standard.set(self.lives, forKey:"Lives")
                            GlobalPlayer.sharedInstance.gameLives = self.lives
                                updateLives(newLive: self.lives)
                              //  self.adOn = 1
                            //}
//                            self.livesLeft.zPosition = -1
//                            self.retry.zPosition = -1
                        }
                    }
           else if touchedNode.name == "tapToRetry"
            {
                if(self.lives > 0 && self.stop == true)
                {
                    self.backInPlace()
                self.gameOverLabel.zPosition = -1
                    self.livesLeft.zPosition = -1
                    self.retry.zPosition = -1
                    self.adsForLives.zPosition = -1
                    self.stopCounting = false
                }
               else if(self.lives == 0)
               {
                   self.ads()
               }
            }
                }
//        if(self.lives > 0 && self.stop == true)
//        {
//            self.backInPlace()
//        self.gameOverLabel.zPosition = -1
//            self.livesLeft.zPosition = -1
//            self.retry.zPosition = -1
//            self.adsForLives.zPosition = -1
//        }
       // self.stopCounting = false
        if(self.firstTime == true)
        {
        self.stop = false
            let docRef = db.collection("Users").document(uid)
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    //let old = docData!["gameTuto"] as? Bool ?? true
                    let ref = self.db.collection("Users").document(self.uid).setData([ "gameTuto" : false ], merge: true){ err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        //print("Document added with ID: \(ref!.documentID)")
                                        print("added1")
                                        

                                    }
                                }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
        let jumpUp = SKAction.moveBy(x:0, y: 70, duration: 0.5)
        let fallBack = SKAction.moveBy(x:0, y: -70, duration: 0.5)
        let sequence = SKAction.sequence([jumpUp, fallBack])
        //player.run(sequence)
        if(Int(MainGuy.position.y) == Int(self.startY))
        {
        MainGuy.run(sequence)
        }
        UserDefaults.standard.set(false, forKey: "gameTuto")
        
    }
    
    
    func updateLives(newLive : Int)
    {
        let docRef = db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let ref = self.db.collection("Users").document(self.uid).setData([ "Lives" : newLive ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added1")

                                }
                            }
            }
            else {
                print("Document does not exist")
            }
        }
    }
//    func setLives()
//    {
//        
//        let docRef = db.collection("Users").document(uid)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                self.lives = docData!["Lives"] as? Int ?? 0
//                
//            }
//            else {
//                print("Document does not exist")
//            }
//        }
//    }
    
    func resetCoin()
    {
        let docRef = db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["coinAmount"] as? Int ?? 0
                let ref = self.db.collection("Users").document(self.uid).setData([ "coinAmount" : old+self.coinAmount ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added1")
                                    self.coinAmount = 0

                                }
                            }
            }
            else {
                print("Document does not exist")
            }
        }
        
    }
//    func createSky() {
//        let topSky = SKSpriteNode(color: UIColor(hue: 0.55, saturation: 0.14, brightness: 0.97, alpha: 1), size: CGSize(width: frame.width, height: frame.height * 0.67))
//        topSky.anchorPoint = CGPoint(x: 0.5, y: 1)
//
//        let bottomSky = SKSpriteNode(color: UIColor(hue: 0.55, saturation: 0.16, brightness: 0.96, alpha: 1), size: CGSize(width: frame.width, height: frame.height * 0.33))
//        bottomSky.anchorPoint = CGPoint(x: 0.5, y: 1)
//
//        topSky.position = CGPoint(x: frame.midX, y: frame.height)
//        bottomSky.position = CGPoint(x: frame.midX, y: bottomSky.frame.height)
//
//        addChild(topSky)
//        addChild(bottomSky)
//
//        bottomSky.zPosition = -40
//        topSky.zPosition = -40
//    }
    
//    func createBackground() {
//        let backgroundTexture = SKTexture(imageNamed: "background")
//
//        for i in 0 ... 1 {
//            let background = SKSpriteNode(texture: backgroundTexture)
//            background.zPosition = -30
//            background.anchorPoint = CGPoint.zero
//            background.position = CGPoint(x: (backgroundTexture.size().width * CGFloat(i)) - CGFloat(1 * i), y: 100)
//            addChild(background)
//            let moveLeft = SKAction.moveBy(x: -backgroundTexture.size().width, y: 0, duration: 20)
//            let moveReset = SKAction.moveBy(x: backgroundTexture.size().width, y: 0, duration: 0)
//            let moveLoop = SKAction.sequence([moveLeft, moveReset])
//            let moveForever = SKAction.repeatForever(moveLoop)
//
//            background.run(moveForever)
//        }
//    }
    
//    func movBack(image :String, y: CGFloat, z: CGFloat, duration: Double, size: CGSize)
//    {
//        for i in 0...1
//        {
//            let background  = SKSpriteNode(imageNamed: image)
//            background.anchorPoint = .zero
//            background.position = CGPoint(x : size.width * CGFloat(i), y: y)
//            background.size = size
//            background.zPosition = z
//
//            let move = SKAction.moveBy(x: -background.size.width, y: 0, duration: duration)
//            let back = SKAction.moveBy(x: background.size.width, y: 0, duration: 0)
//
//            let sequence = SKAction.sequence([move, back])
//            let repeatAction = SKAction.repeatForever(sequence)
//
//            addChild(background)
//            background.run(repeatAction)
//        }
//    }
    
    func createGround() {
        let groundTexture = SKTexture(imageNamed: "ground")

        for i in 0 ... 1 {
            let ground = SKSpriteNode(texture: groundTexture)
            ground.zPosition = -10
            ground.position = CGPoint(x: (groundTexture.size().width / 2.0 + (groundTexture.size().width * CGFloat(i))), y: groundTexture.size().height / 2)

            addChild(ground)

            let moveLeft = SKAction.moveBy(x: -groundTexture.size().width, y: 0, duration: 5)
            let moveReset = SKAction.moveBy(x: groundTexture.size().width, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)

            ground.run(moveForever)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {

        
//        if(self.stop == false)
//        {
//            self.lives = GlobalPlayer.sharedInstance.gameLives
//        }
        
        cam.position.x = MainGuy.position.x
       // count += 0.01
        //self.lives = UserDefaults.standard.integer(forKey:"Lives") ?? 5
        
        if(self.lives == 5)
        {
            self.timeRemaining.text = "Full"
        }
        else if(self.lives != 5)
        {
        //if self.duration > 0 {
            //self.duration -= 1
            self.duration = GlobalPlayer.sharedInstance.timeTilLife 
            self.timeString(time: self.duration)
            if(self.duration == 0 && self.lives < 5)
            {
                self.lives = self.lives+1
            }
        //}
        //else
        //{
            //GlobalPlayer.sharedInstance.timeTilLife = 3600.0
       // }
        }
        
        if(self.lives == 0)
        {
            label1.zPosition = -1
            label2.zPosition = -1
            label3.zPosition = -1
            label4.zPosition = -1
            label5.zPosition = -1
            //self.setLives()
        }
        
        if(self.lives == 0)
        {
            gameOverLabel.zPosition = 3
        }
        else if(self.lives != 0)
        {
            gameOverLabel.zPosition = -1
        }
        
        if(self.count < 60)
        {
            self.count = self.count+1
        }
        else if(self.count >= 60)
        {
            self.count = 0
            if(self.difficulty == 1)
            {
                self.difficulty = 2
            }
            else if(self.difficulty == 2)
            {
                self.difficulty = 1
            }
        }
        
        let random1 = Int.random(in: 1...4)
        let difficulty = Int.random(in: 1...2)
        let dx = background.position.x - cam.position.x
        let dx1 = background2.position.x - cam.position.x
        let dx2 = background3.position.x - cam.position.x
        let dx3 = background4.position.x - cam.position.x
        let dx4 = background5.position.x - cam.position.x
        let dxx5 = background6.position.x - cam.position.x
        let dxx6 = background7.position.x - cam.position.x
        let dxx7 = background8.position.x - cam.position.x
        let dxx8 = background9.position.x - cam.position.x
        let dxx9 = background10.position.x - cam.position.x
        let dxx10 = background11.position.x - cam.position.x
        let dxx11 = background12.position.x - cam.position.x
        let dxx12 = background13.position.x - cam.position.x
        let dxx13 = background14.position.x - cam.position.x
        let dxx14 = background15.position.x - cam.position.x
        let dxx15 = background16.position.x - cam.position.x
        let dxx16 = background17.position.x - cam.position.x
        
        let dxa = bg.position.x - cam.position.x
        let dxa1 = bg2.position.x - cam.position.x
        let dxa2 = bg3.position.x - cam.position.x
        let dxa3 = bg4.position.x - cam.position.x
        let dxa4 = bg5.position.x - cam.position.x
        let dxa5 = bg6.position.x - cam.position.x
        let dxa6 = bg7.position.x - cam.position.x
        let dxa7 = bg8.position.x - cam.position.x
        let dxa8 = bg9.position.x - cam.position.x
        let dxa9 = bg10.position.x - cam.position.x
        let dxa10 = bg11.position.x - cam.position.x
        let dxa11 = bg12.position.x - cam.position.x
        let dxa12 = bg13.position.x - cam.position.x
        let dxa13 = bg14.position.x - cam.position.x
        let dxa14 = bg15.position.x - cam.position.x
        let dxa15 = bg16.position.x - cam.position.x
        let dxa16 = bg17.position.x - cam.position.x
        let dxa17 = bg18.position.x - cam.position.x
        
        let d = bga.position.x - cam.position.x
        let d1 = bga2.position.x - cam.position.x
        let d2 = bga3.position.x - cam.position.x
        let d3 = bga4.position.x - cam.position.x
        let d4 = bga5.position.x - cam.position.x
        let d5 = bga6.position.x - cam.position.x
        let d6 = bga7.position.x - cam.position.x
        let d7 = bga8.position.x - cam.position.x
        let d8 = bga9.position.x - cam.position.x
        let d9 = bga10.position.x - cam.position.x
        let d10 = bga11.position.x - cam.position.x
        let d11 = bga12.position.x - cam.position.x
        let d12 = bga13.position.x - cam.position.x
        let d13 = bga14.position.x - cam.position.x
        let d14 = bga15.position.x - cam.position.x
        let d15 = bga16.position.x - cam.position.x
        let d16 = bga17.position.x - cam.position.x
        let d17 = bga18.position.x - cam.position.x
        let d18 = bga19.position.x - cam.position.x
        
        let dx5 = box1.position.x - MainGuy.position.x
        let dx6 = trashCan.position.x - MainGuy.position.x
        let dx7 = rock.position.x - MainGuy.position.x
        let dx8 = coin.position.x - cam.position.x
        let dx9 = coin.position.x - cam.position.x
        let dx10 = coin.position.x - cam.position.x
        let dx11 = coin.position.x - cam.position.x
    

        
            
        if dx < -(background.size.width + size.width / 2)
        {
            background.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width
        }
        
        if dx1 < -(background2.size.width + size.width / 2)
        {
            background2.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width
        }
        
        if dx2 < -(background3.size.width + size.width / 2)
        {
            background3.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width
        }
        
        if dx3 < -(background4.size.width + size.width / 2)
        {
            background4.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width
        }
        
        if dx4 < -(background5.size.width + size.width / 2)
        {
            background5.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width
            
        }
        
        if dxx5 < -(background6.size.width + size.width / 2)
        {
            background6.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width
        }
        
        if dxx6 < -(background7.size.width + size.width / 2)
        {
            background7.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width
        }
        
        if dxx7 < -(background8.size.width + size.width / 2)
        {
            background8.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width
        }
        
        if dxx8 < -(background9.size.width + size.width / 2)
        {
            background9.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width
        }
        
        if dxx9 < -(background10.size.width + size.width / 2)
        {
            background10.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width + background10.size.width
        }
        
        if dxx10 < -(background11.size.width + size.width / 2)
        {
            background11.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width + background10.size.width + background11.size.width
        }
        
        if dxx11 < -(background12.size.width + size.width / 2)
        {
            background12.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width + background10.size.width + background11.size.width + background12.size.width
        }
        
        if dxx12 < -(background13.size.width + size.width / 2)
        {
            background13.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width + background10.size.width + background11.size.width + background12.size.width + background13.size.width
        }
        
        if dxx13 < -(background14.size.width + size.width / 2)
        {
            background14.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width + background10.size.width + background11.size.width + background12.size.width + background13.size.width + background14.size.width
        }
        
        if dxx14 < -(background15.size.width + size.width / 2)
        {
            background15.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width + background10.size.width + background11.size.width + background12.size.width + background13.size.width + background14.size.width + background15.size.width
        }
        
        if dxx15 < -(background16.size.width + size.width / 2)
        {
            background16.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width + background10.size.width + background11.size.width + background12.size.width + background13.size.width + background14.size.width + background15.size.width + background16.size.width
        }
        
        if dxx16 < -(background17.size.width + size.width / 2)
        {
            background17.position.x += background.size.width + background2.size.width + background3.size.width + background4.size.width + background5.size.width + background6.size.width + background7.size.width + background8.size.width + background9.size.width + background10.size.width + background11.size.width + background12.size.width + background13.size.width + background14.size.width + background15.size.width + background16.size.width + background17.size.width
            
            if(background17.zPosition == 1)
            {
                background.zPosition = -1
                background2.zPosition = -1
                background3.zPosition = -1
                background4.zPosition = -1
                background5.zPosition = -1
                background6.zPosition = -1
                background7.zPosition = -1
                background8.zPosition = -1
                background9.zPosition = -1
                background10.zPosition = -1
                background11.zPosition = -1
                background12.zPosition = -1
                background13.zPosition = -1
                background14.zPosition = -1
                background15.zPosition = -1
                background16.zPosition = -1
                background17.zPosition = -1
                
                bg.zPosition = 1
                bg2.zPosition = 1
                bg3.zPosition = 1
                bg4.zPosition = 1
                bg5.zPosition = 1
                bg6.zPosition = 1
                bg7.zPosition = 1
                bg8.zPosition = 1
                bg9.zPosition = 1
                bg10.zPosition = 1
                bg11.zPosition = 1
                bg12.zPosition = 1
                bg13.zPosition = 1
                bg14.zPosition = 1
                bg15.zPosition = 1
                bg16.zPosition = 1
                bg17.zPosition = 1
                bg18.zPosition = 1
            }
        }
        
        if dxa < -(bg.size.width + size.width / 2)
        {
            bg.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width
        }
        
        if dxa1 < -(bg2.size.width + size.width / 2)
        {
            bg2.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width
        }
        
        if dxa2 < -(bg3.size.width + size.width / 2)
        {
            bg3.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width
        }
        
        if dxa3 < -(bg4.size.width + size.width / 2)
        {
            bg4.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width
        }
        
        if dxa4 < -(bg5.size.width + size.width / 2)
        {
            bg5.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width
        
        }
        
        if dxa5 < -(bg6.size.width + size.width / 2)
        {
            bg6.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width
        }
        
        if dxa6 < -(bg7.size.width + size.width / 2)
        {
            bg7.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width
        }
        
        
        if dxa7 < -(bg8.size.width + size.width / 2)
        {
            bg8.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width
        }
        
        if dxa8 < -(bg9.size.width + size.width / 2)
        {
            bg9.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width
        }
        
        if dxa9 < -(bg10.size.width + size.width / 2)
        {
            bg10.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width
        }
        
        if dxa10 < -(bg11.size.width + size.width / 2)
        {
            bg11.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width + bg11.size.width
        }
        
        if dxa11 < -(bg12.size.width + size.width / 2)
        {
            bg12.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width + bg11.size.width + bg12.size.width
        }
        
        if dxa12 < -(bg13.size.width + size.width / 2)
        {
            bg13.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width + bg11.size.width + bg12.size.width + bg13.size.width
        }
        
        if dxa13 < -(bg14.size.width + size.width / 2)
        {
            bg14.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width + bg11.size.width + bg12.size.width + bg13.size.width + bg14.size.width
        }
        
        if dxa14 < -(bg15.size.width + size.width / 2)
        {
            bg15.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width + bg11.size.width + bg12.size.width + bg13.size.width + bg14.size.width + bg15.size.width
        }
        
        if dxa15 < -(bg16.size.width + size.width / 2)
        {
            bg16.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width + bg11.size.width + bg12.size.width + bg13.size.width + bg14.size.width + bg15.size.width + bg16.size.width
        }
        
        if dxa16 < -(bg17.size.width + size.width / 2)
        {
            bg17.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width + bg11.size.width + bg12.size.width + bg13.size.width + bg14.size.width + bg15.size.width + bg16.size.width + bg17.size.width
        }
        
        if dxa17 < -(bg18.size.width + size.width / 2)
        {
            bg18.position.x += bg.size.width + bg2.size.width + bg3.size.width + bg4.size.width + bg5.size.width + bg6.size.width + bg7.size.width + bg8.size.width + bg9.size.width + bg10.size.width + bg11.size.width + bg12.size.width + bg13.size.width + bg14.size.width + bg15.size.width + bg16.size.width + bg17.size.width + bg18.size.width
            
            if(bg18.zPosition == 1)
            {
            bg.zPosition = -2
            bg2.zPosition = -2
            bg3.zPosition = -2
            bg4.zPosition = -2
            bg5.zPosition = -2
                bg6.zPosition = -2
                bg7.zPosition = -2
                bg8.zPosition = -2
                bg9.zPosition = -2
                bg10.zPosition = -2
                bg11.zPosition = -2
                bg12.zPosition = -2
                bg13.zPosition = -2
                bg14.zPosition = -2
                bg15.zPosition = -2
                bg16.zPosition = -2
                bg17.zPosition = -2
                bg18.zPosition = -2
            
            bga.zPosition = 1
            bga2.zPosition = 1
            bga3.zPosition = 1
            bga4.zPosition = 1
            bga5.zPosition = 1
                bga6.zPosition = 1
                bga7.zPosition = 1
                bga8.zPosition = 1
                bga9.zPosition = 1
                bga10.zPosition = 1
                bga11.zPosition = 1
                bga12.zPosition = 1
                bga13.zPosition = 1
                bga14.zPosition = 1
                bga15.zPosition = 1
                bga16.zPosition = 1
                bga17.zPosition = 1
                bga18.zPosition = 1
                bga19.zPosition = 1

            }
        }
        
        if d < -(bga.size.width + size.width / 2)
        {
            bga.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width
        }
        
        if d1 < -(bga2.size.width + size.width / 2)
        {
            bga2.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width
        }
        
        if d2 < -(bga3.size.width + size.width / 2)
        {
            bga3.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width
        }
        
        if d3 < -(bga4.size.width + size.width / 2)
        {
            bga4.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width
        }
        
        if d4 < -(bga5.size.width + size.width / 2)
        {
            bga5.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width
            
        }
        
        if d5 < -(bga6.size.width + size.width / 2)
        {
            bga6.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width
        }
        
        if d6 < -(bga7.size.width + size.width / 2)
        {
            bga7.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width
        }
        
        if d7 < -(bga8.size.width + size.width / 2)
        {
            bga8.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width
        }
        
        if d8 < -(bga9.size.width + size.width / 2)
        {
            bga9.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width
        }
        
        if d9 < -(bga10.size.width + size.width / 2)
        {
            bga10.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width
        }
        
        if d10 < -(bga11.size.width + size.width / 2)
        {
            bga11.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width
        }
        
        if d11 < -(bga12.size.width + size.width / 2)
        {
            bga12.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width + bga12.size.width
        }
        
        if d12 < -(bga13.size.width + size.width / 2)
        {
            bga13.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width + bga12.size.width + bga13.size.width
        }
        
        if d13 < -(bga14.size.width + size.width / 2)
        {
            bga14.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width + bga12.size.width + bga13.size.width + bga14.size.width
        }
        
        if d14 < -(bga15.size.width + size.width / 2)
        {
            bga15.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width + bga12.size.width + bga13.size.width + bga14.size.width + bga15.size.width
        }
        
        if d15 < -(bga16.size.width + size.width / 2)
        {
            bga16.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width + bga12.size.width + bga13.size.width + bga14.size.width + bga15.size.width + bga16.size.width
        }
        
        if d16 < -(bga17.size.width + size.width / 2)
        {
            bga17.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width + bga12.size.width + bga13.size.width + bga14.size.width + bga15.size.width + bga16.size.width + bga17.size.width
        }
        
        if d17 < -(bga18.size.width + size.width / 2)
        {
            bga18.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width + bga12.size.width + bga13.size.width + bga14.size.width + bga15.size.width + bga16.size.width + bga17.size.width + bga18.size.width
        }
        
        if d18 < -(bga19.size.width + size.width / 2)
        {
            bga19.position.x += bga.size.width + bga2.size.width + bga3.size.width + bga4.size.width + bga5.size.width + bga6.size.width + bga7.size.width + bga8.size.width + bga9.size.width + bga10.size.width + bga11.size.width + bga12.size.width + bga13.size.width + bga14.size.width + bga15.size.width + bga16.size.width + bga17.size.width + bga18.size.width + bga19.size.width
            
            if(bga19.zPosition == 1)
            {
            bga.zPosition = -3
            bga2.zPosition = -3
            bga3.zPosition = -3
            bga4.zPosition = -3
            bga5.zPosition = -3
                bga6.zPosition = -3
                bga7.zPosition = -3
                bga8.zPosition = -3
                bga9.zPosition = -3
                bga10.zPosition = -3
                bga11.zPosition = -3
                bga12.zPosition = -3
                bga13.zPosition = -3
                bga14.zPosition = -3
                bga15.zPosition = -3
                bga16.zPosition = -3
                bga17.zPosition = -3
                bga18.zPosition = -3
                bga19.zPosition = -3
            
            background.zPosition = 1
            background2.zPosition = 1
            background3.zPosition = 1
            background4.zPosition = 1
            background5.zPosition = 1
                background6.zPosition = 1
                background7.zPosition = 1
                background8.zPosition = 1
                background9.zPosition = 1
                background10.zPosition = 1
                background11.zPosition = 1
                background12.zPosition = 1
                background13.zPosition = 1
                background14.zPosition = 1
                background15.zPosition = 1
                background16.zPosition = 1
                background17.zPosition = 1
                
            }
        }
        
        
        if coin.position.x < -10
        {
            if(random1 == 1)
            {
            coin.position.x = MainGuy.position.x + 150
            coin.zPosition = 3
            }
            else if(random1 == 2)
            {
                coin.position.x = MainGuy.position.x + 100
                coin.zPosition = 3
            }
            else if(random1 == 4)
            {
            coin.position.x = MainGuy.position.x + 100
            coin.zPosition = 3
            }
        }
        
        if coin1.position.x < -10
        {
            if(random1 == 1)
            {
            coin1.position.x = MainGuy.position.x + 230
            coin1.zPosition = 3
            }
            else if(random1 == 3)
            {
            coin1.position.x = MainGuy.position.x + 300
            coin1.zPosition = 3
            }
            else if(random1 == 4)
            {
            coin1.position.x = MainGuy.position.x + 100
            coin1.zPosition = 3
            }
        }
        
        if coin2.position.x < -10
        {
            if(random1 == 3)
            {
            coin2.position.x = MainGuy.position.x + 50
            coin2.zPosition = 3
            }
            else if(random1 == 4)
            {
            coin2.position.x = MainGuy.position.x + 100
            coin2.zPosition = 3
            }
        }
        
        if coin3.position.x < -10
        {
            if(random1 == 3)
            {
            coin3.position.x = MainGuy.position.x + 100
            coin3.zPosition = 3
            }
            else if(random1 == 4)
            {
            coin3.position.x = MainGuy.position.x + 100
            coin3.zPosition = 3
            }
        }
        

        
        if box1.position.x < -10
        {
            box1.zPosition = 3
            if(random1 == 1)
            {
                if(dx5 < 211 && dx5 > 149)
                {
                box1.position.x = MainGuy.position.x + 250
                }
                else if(dx6 < 211 && dx5 > 149)
                {
                box1.position.x = MainGuy.position.x + 250
                }
                else if(dx7 < 211 && dx5 > 149)
                {
                box1.position.x = MainGuy.position.x + 250
                }
                else
                {
                box1.position.x = MainGuy.position.x + 180
                }
            }
            else if(random1 == 2)
            {
                if(dx5 < 371 && dx5 > 291)
                {
                    box1.position.x = MainGuy.position.x + 230
                }
                if(dx6 < 371 && dx5 > 291)
                {
                    box1.position.x = MainGuy.position.x + 230
                }
                if(dx7 < 371 && dx5 > 291)
                {
                    box1.position.x = MainGuy.position.x + 230
                }
                else
                {
            box1.position.x = MainGuy.position.x + 330
                }
            
            }
//            else if(random1 == 3)
//            {
//                rock.zPosition = 3
//                rock.position.x = MainGuy.position.x + 220
//            }
            
        }
        
        if trashCan.position.x < -5
        {
            trashCan.zPosition = 3
//            if(difficulty == 1)
//            {
            if(random1 == 1)
            {
                trashCan.position.x = MainGuy.position.x + 400
            }
//            else if(random1 == 2)
//            {
//            trashCan.position.x = MainGuy.position.x + 60.5
//            }
            else if(random1 == 3)
            {
            trashCan.position.x = MainGuy.position.x + 130
            }
            //}
        }
        
        if rock.position.x < -5
        {
            rock.zPosition = 3
            if(random1 == 3)
            {
                rock.zPosition = 3
                rock.position.x = MainGuy.position.x + 250
            }
//            if(random1 == 1)
//            {
//                rock.position.x = MainGuy.position.x + 45.5
//            }
//            else if(random1 == 2)
//            {
//            rock.position.x = MainGuy.position.x + 15.5
//            }
//            else if(random1 == 3)
//            {
//            rock.position.x = MainGuy.position.x + 90.5
//            }
        }
//        if background.position.x < -background.size.width+50
//        {
//            background.position.x = background2.position.x + background.size.width
//        }
//
//        else if background2.position.x < -background2.size.width+50
//        {
//            background2.position.x = background.position.x + background2.size.width
//        }

//        else
//        {
        if(self.stop == false && self.lives != 0)
        {
            self.firstStart = false
            if(background.zPosition == 1)
            {
                background.position.x -= 0.1
                background2.position.x -= 0.1
                background3.position.x -= 0.1
                background4.position.x -= 0.1
                background5.position.x -= 0.1
                background6.position.x -= 0.1
                background7.position.x -= 0.1
                background8.position.x -= 0.1
                background9.position.x -= 0.1
                background10.position.x -= 0.1
                background11.position.x -= 0.1
                background12.position.x -= 0.1
                background13.position.x -= 0.1
                background14.position.x -= 0.1
                background15.position.x -= 0.1
                background16.position.x -= 0.1
                background17.position.x -= 0.1
            }
            if(bg.zPosition == 1)
            {
                bg.position.x -= 0.1
                bg2.position.x -= 0.1
                bg3.position.x -= 0.1
                bg4.position.x -= 0.1
                bg5.position.x -= 0.1
                bg6.position.x -= 0.1
                bg7.position.x -= 0.1
                bg8.position.x -= 0.1
                bg9.position.x -= 0.1
                bg10.position.x -= 0.1
                bg11.position.x -= 0.1
                bg12.position.x -= 0.1
                bg13.position.x -= 0.1
                bg14.position.x -= 0.1
                bg15.position.x -= 0.1
                bg16.position.x -= 0.1
                bg17.position.x -= 0.1
                bg18.position.x -= 0.1
            }
            if(bga.zPosition == 1)
            {
                bga.position.x -= 0.1
                bga2.position.x -= 0.1
                bga3.position.x -= 0.1
                bga4.position.x -= 0.1
                bga5.position.x -= 0.1
                bga6.position.x -= 0.1
                bga7.position.x -= 0.1
                bga8.position.x -= 0.1
                bga9.position.x -= 0.1
                bga10.position.x -= 0.1
                bga11.position.x -= 0.1
                bga12.position.x -= 0.1
                bga13.position.x -= 0.1
                bga14.position.x -= 0.1
                bga15.position.x -= 0.1
                bga16.position.x -= 0.1
                bga17.position.x -= 0.1
                bga18.position.x -= 0.1
                bga19.position.x -= 0.1
            }
            coin.position.x -= 1
            coin1.position.x -= 1
            coin2.position.x -= 1
            coin3.position.x -= 1
            box1.position.x -= 1
            rock.position.x -= 1
            trashCan.position.x -= 1
            label1.zPosition = -1
            label2.zPosition = -1
            label3.zPosition = -1
            label4.zPosition = -1
            label5.zPosition = -1
        }
        
        
        
        
              if(Int(box1.position.x)-Int(rock.position.x) <= 30 && Int(box1.position.x)-Int(rock.position.x) >= 0)
        {
                  box1.zPosition = -1
        }
        
        
        if( Int(box1.position.x)-Int(rock.position.x) >= -30 && Int(box1.position.x)-Int(rock.position.x) <= 0)
  {
            box1.zPosition = -1
  }
        
        if( Int(box1.position.x)-Int(trashCan.position.x) <= 30 && Int(box1.position.x)-Int(trashCan.position.x) >= 0)
  {
            box1.zPosition = -1
  }
        
        if(Int(box1.position.x)-Int(trashCan.position.x) >= -30 && Int(box1.position.x)-Int(trashCan.position.x) <= 0)
  {
            box1.zPosition = -1
  }
        
        if( Int(rock.position.x)-Int(trashCan.position.x) <= 30 && Int(rock.position.x)-Int(trashCan.position.x) >= 0)
  {
            rock.zPosition = -1
  }
        
        if(Int(rock.position.x)-Int(trashCan.position.x) >= -30 && Int(rock.position.x)-Int(trashCan.position.x) <= 0)
  {
            rock.zPosition = -1
  }
        
        
              if( Int(coin.position.x)-Int(rock.position.x) <= 15 && Int(coin.position.x)-Int(rock.position.x) >= 0)
        {
                  coin.zPosition = -1
        }
        
        
        if(Int(coin.position.x)-Int(rock.position.x) >= -15 && Int(coin.position.x)-Int(rock.position.x) <= 0)
  {
            coin.zPosition = -1
  }
        
        if(Int(coin.position.x)-Int(trashCan.position.x) <= 15 && Int(coin.position.x)-Int(trashCan.position.x) >= 0)
  {
            coin.zPosition = -1
  }
        
        if(Int(coin.position.x)-Int(trashCan.position.x) >= -15 && Int(coin.position.x)-Int(trashCan.position.x) <= 0)
  {
            coin.zPosition = -1
  }
  
  
  if(Int(coin.position.x)-Int(box1.position.x) >= -15 && Int(coin.position.x)-Int(box1.position.x) <= 0)
{
      coin.zPosition = -1
}
        
        if(Int(coin.position.x)-Int(box1.position.x) <= 15 && Int(coin.position.x)-Int(box1.position.x) >= 0)
      {
            coin.zPosition = -1
      }
        
        if(Int(coin1.position.x)-Int(rock.position.x) <= 15 && Int(coin1.position.x)-Int(rock.position.x) >= 0)
  {
            coin1.zPosition = -1
  }
  
  
  if(Int(coin1.position.x)-Int(rock.position.x) >= -15 && Int(coin1.position.x)-Int(rock.position.x) <= 0)
{
      coin1.zPosition = -1
}
  
  if(Int(coin1.position.x)-Int(trashCan.position.x) <= 15 && Int(coin1.position.x)-Int(trashCan.position.x) >= 0)
{
      coin1.zPosition = -1
}
        
        if(Int(coin1.position.x)-Int(trashCan.position.x) >= -15 && Int(coin1.position.x)-Int(trashCan.position.x) <= 0)
      {
            coin1.zPosition = -1
      }


if(Int(coin1.position.x)-Int(box1.position.x) >= -15 && Int(coin1.position.x)-Int(box1.position.x) <= 0)
{
coin1.zPosition = -1
}
        
        if(Int(coin1.position.x)-Int(box1.position.x) <= 15 && Int(coin1.position.x)-Int(box1.position.x) >= 0)
        {
        coin1.zPosition = -1
        }
        
        if(Int(coin2.position.x)-Int(rock.position.x) <= 15 && Int(coin2.position.x)-Int(rock.position.x) >= 0)
  {
            coin2.zPosition = -1
  }
  
  
  if(Int(coin2.position.x)-Int(rock.position.x) >= -15 && Int(coin2.position.x)-Int(rock.position.x) <= 0)
{
      coin2.zPosition = -1
}
  
  if(Int(coin2.position.x)-Int(trashCan.position.x) <= 15 && Int(coin2.position.x)-Int(trashCan.position.x) >= 0)
{
      coin2.zPosition = -1
}
        
        if(Int(coin2.position.x)-Int(trashCan.position.x) >= -15 && Int(coin2.position.x)-Int(trashCan.position.x) <= 0)
      {
            coin2.zPosition = -1
      }


if(Int(coin2.position.x)-Int(box1.position.x) >= -15 && Int(coin2.position.x)-Int(box1.position.x) <= 0)
{
coin2.zPosition = -1
}
        
        if(Int(coin2.position.x)-Int(box1.position.x) <= 15 && Int(coin2.position.x)-Int(box1.position.x) >= 0)
        {
        coin2.zPosition = -1
        }
        
        if(Int(coin3.position.x)-Int(rock.position.x) <= 15 && Int(coin3.position.x)-Int(rock.position.x) >= 0)
  {
            coin3.zPosition = -1
  }
  
  
  if( Int(coin3.position.x)-Int(rock.position.x) >= -15 && Int(coin3.position.x)-Int(rock.position.x) <= 0)
{
      coin3.zPosition = -1
}
  
  if(Int(coin3.position.x)-Int(trashCan.position.x) <= 15 && Int(coin3.position.x)-Int(trashCan.position.x) >= 0)
{
      coin3.zPosition = -1
}
        if(Int(coin3.position.x)-Int(trashCan.position.x) >= -15 && Int(coin3.position.x)-Int(trashCan.position.x) <= 0)
      {
            coin3.zPosition = -1
      }


        if(Int(coin3.position.x)-Int(box1.position.x) <= 15 && Int(coin3.position.x)-Int(box1.position.x) >= 0)
        {
        coin3.zPosition = -1
        }
        
if(Int(coin3.position.x)-Int(box1.position.x) >= -15 && Int(coin3.position.x)-Int(box1.position.x) <= 0)
{
coin3.zPosition = -1
}

        if(Int(rock.position.x) == Int(MainGuy.position.x) && rock.position.y-MainGuy.position.y <= 25 && rock.position.y-MainGuy.position.y >= 0 && rock.zPosition != -1 && self.adOn == 0)
        {
            self.stop = true
            if(self.lives > 0 && self.stopCounting == false && self.firstStart == false)
            {
                if(self.lives == 5)
                {
                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
                    UserDefaults.standard.set(Date(), forKey:"creationTime")
                    print("Date1 ddd")
                }
            self.lives -= 1
                resetCoin()
            myLabel2.text = String(self.lives)
                self.stopCounting = true
                livesLeft.text = "\(String(self.lives)) lives left"
                UserDefaults.standard.set(self.lives, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            updateLives(newLive: self.lives)
//                if(self.lives == 4)
//                {
//                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
//                }
                //livesLeft.zPosition = 3
            }
            gameOverLabel.zPosition = 3
            if(self.lives > 0)
            {
            retry.zPosition = 3
                retry.text = "Tap to retry"
                livesLeft.zPosition = 3
            }
            if(self.lives == 0)
            {
                retry.zPosition = 3
                retry.text = "Tap to retry"
                adsForLives.position.y = size.height/2 - 120
                resetCoin()
                UserDefaults.standard.set(0, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            }
            if(self.lives < 5)
            {
                self.adsForLives.zPosition = 3
                adsForLives.position.y = size.height/2 - 100
            }
//            if(self.lives == 4)
//         {
//                UserDefaults.standard.set(Date(), forKey:"creationTime")
//                print("Date1 ddd")
//            }
          
//                UserDefaults.standard.set(Date(), forKey:"creationTime")
            
            //livesLeft.zPosition = 3
        }
        
        if(Int(box1.position.x) == Int(MainGuy.position.x) && box1.position.y-MainGuy.position.y <= 25 && box1.position.y-MainGuy.position.y >= 0 && box1.zPosition != -1 && self.adOn == 0)
        {
           self.stop = true
            if(self.lives > 0 && self.stopCounting == false && self.firstStart == false)
            {
                if(self.lives == 5)
                {
                    UserDefaults.standard.set(Date(), forKey:"creationTime")
                    print("Date1 ddd")
                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
                }
            self.lives -= 1
                resetCoin()
            myLabel2.text = String(self.lives)
                self.stopCounting = true
                livesLeft.text = "\(String(self.lives)) lives left"
                UserDefaults.standard.set(self.lives, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            updateLives(newLive: self.lives)
//                if(self.lives == 4)
//                {
//                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
//                }
                //livesLeft.zPosition = 3
            }
            gameOverLabel.zPosition = 3
            if(self.lives > 0)
            {
            retry.zPosition = 3
                retry.text = "Tap to retry"
                livesLeft.zPosition = 3
            }
            if(self.lives == 0)
            {
                retry.zPosition = 3
                retry.text = "Tap to retry"
                resetCoin()
                adsForLives.position.y = size.height/2 - 100
                UserDefaults.standard.set(0, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            }
            if(self.lives < 5)
            {
                self.adsForLives.zPosition = 3
                adsForLives.position.y = size.height/2 - 150
            }
//            if(self.lives == 0)
//            {
//            if(self.lives == 4)
//         {
//                UserDefaults.standard.set(Date(), forKey:"creationTime")
//                print("Date1 ddd")
//            }
             //   UserDefaults.standard.set(Date(), forKey:"creationTime")

            //}
            //livesLeft.zPosition = 3
        }
        
        
        if(Int(trashCan.position.x) == Int(MainGuy.position.x) && trashCan.position.y-MainGuy.position.y <= 25 && trashCan.position.y-MainGuy.position.y >= 0 && trashCan.zPosition != -1 && self.adOn == 0)
        {
            self.stop = true
            if(self.lives > 0 && self.stopCounting == false && self.firstStart == false)
            {
                if(self.lives == 5)
                {
                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
                    UserDefaults.standard.set(Date(), forKey:"creationTime")
                    print("Date1 ddd")
                }
            self.lives -= 1
                resetCoin()
            myLabel2.text = String(self.lives)
                self.stopCounting = true
                livesLeft.text = "\(String(self.lives)) lives left"
                UserDefaults.standard.set(self.lives, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            updateLives(newLive: self.lives)
//                if(self.lives == 4)
//                {
//                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
//                }
                //livesLeft.zPosition = 3
            }
            gameOverLabel.zPosition = 3
            if(self.lives > 0)
            {
            retry.zPosition = 3
                retry.text = "Tap to retry"
                livesLeft.zPosition = 3
            }
            if(self.lives == 0)
            {
                retry.zPosition = 3
                retry.text = "Tap to retry"
                resetCoin()
                adsForLives.position.y = size.height/2 - 100
                UserDefaults.standard.set(0, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            }
            if(self.lives < 5)
            {
                self.adsForLives.zPosition = 3
                adsForLives.position.y = size.height/2 - 150
            }
//            if(self.lives == 0)
//            {
//            if(self.lives == 4)
//         {
//                UserDefaults.standard.set(Date(), forKey:"creationTime")
//                print("Date1 ddd")
//            }
               // UserDefaults.standard.set(Date(), forKey:"creationTime")

            //}
            //livesLeft.zPosition = 3
        }
        
        if(Int(rock.position.x) == Int(MainGuy.position.x) && rock.position.y-MainGuy.position.y >= -25 && rock.position.y-MainGuy.position.y <= 0 && rock.zPosition != -1 && self.adOn == 0)
        {
            self.stop = true
            if(self.lives > 0 && self.stopCounting == false && self.firstStart == false)
            {
                if(self.lives == 5)
                {
                    UserDefaults.standard.set(Date(), forKey:"creationTime")
                    print("Date1 ddd")
                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
                }
            self.lives -= 1
                resetCoin()
            myLabel2.text = String(self.lives)
                self.stopCounting = true
                livesLeft.text = "\(String(self.lives)) lives left"
                UserDefaults.standard.set(self.lives, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            updateLives(newLive: self.lives)
//                if(self.lives == 4)
//                {
//                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
//                }
                //livesLeft.zPosition = 3
            }
            gameOverLabel.zPosition = 3
            if(self.lives > 0)
            {
            retry.zPosition = 3
                retry.text = "Tap to retry"
                livesLeft.zPosition = 3
            }
            if(self.lives == 0)
            {
                retry.zPosition = 3
                retry.text = "Tap to retry"
                resetCoin()
                adsForLives.position.y = size.height/2 - 100
                UserDefaults.standard.set(0, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            }
            if(self.lives < 5)
            {
                self.adsForLives.zPosition = 3
                adsForLives.position.y = size.height/2 - 150
            }
//            if(self.lives == 0)
//            {
//            if(self.lives == 4)
//         {
//                UserDefaults.standard.set(Date(), forKey:"creationTime")
//                print("Date1 ddd")
//            }
                //UserDefaults.standard.set(Date(), forKey:"creationTime")
               
            //}
            //livesLeft.zPosition = 3
        }

        if(Int(box1.position.x) == Int(MainGuy.position.x) && box1.position.y-MainGuy.position.y >= -25 && box1.position.y-MainGuy.position.y <= 0 && box1.zPosition != -1 && self.adOn == 0)
        {
            self.stop = true
            if(self.lives > 0 && self.stopCounting == false && self.firstStart == false)
            {
                if(self.lives == 5)
                {
                    UserDefaults.standard.set(Date(), forKey:"creationTime")
                    print("Date1 ddd")
                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
                }
            self.lives -= 1
                resetCoin()
            myLabel2.text = String(self.lives)
                self.stopCounting = true
                livesLeft.text = "\(String(self.lives)) lives left"
                UserDefaults.standard.set(self.lives, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            updateLives(newLive: self.lives)
                if(self.lives == 4)
                {
                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
                }
                //livesLeft.zPosition = 3
            }
            gameOverLabel.zPosition = 3
            if(self.lives > 0)
            {
            retry.zPosition = 3
                retry.text = "Tap to retry"
                livesLeft.zPosition = 3
            }
            if(self.lives == 0)
            {
                retry.zPosition = 3
                retry.text = "Tap to retry"
                resetCoin()
                adsForLives.position.y = size.height/2 - 100
                UserDefaults.standard.set(0, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            }
            if(self.lives < 5)
            {
                self.adsForLives.zPosition = 3
                adsForLives.position.y = size.height/2 - 150
            }
//            if(self.lives == 0)
//            {
//            if(self.lives == 4)
//         {
//                UserDefaults.standard.set(Date(), forKey:"creationTime")
//                print("Date1 ddd")
//            }
               // UserDefaults.standard.set(Date(), forKey:"creationTime")

           // }
            //livesLeft.zPosition = 3
        }


        if(Int(trashCan.position.x) == Int(MainGuy.position.x) && trashCan.position.y-MainGuy.position.y >= -25 && trashCan.position.y-MainGuy.position.y <= 0 && trashCan.zPosition != -1 && self.adOn == 0)
        {
            self.stop = true
            if(self.lives > 0 && self.stopCounting == false && self.firstStart == false)
            {
                if(self.lives == 5)
                {
                    UserDefaults.standard.set(Date(), forKey:"creationTime")
                    print("Date1 ddd")
                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
                }
            self.lives -= 1
                resetCoin()
            myLabel2.text = String(self.lives)
                self.stopCounting = true
                livesLeft.text = "\(String(self.lives)) lives left"
                UserDefaults.standard.set(self.lives, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            updateLives(newLive: self.lives)
                if(self.lives == 4)
                {
                    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
                }

            }
            gameOverLabel.zPosition = 3
            if(self.lives > 0)
            {
            retry.zPosition = 3
                retry.text = "Tap to retry"
                livesLeft.zPosition = 3
            }
            if(self.lives == 0)
            {
                retry.zPosition = 3
                retry.text = "Tap to retry"
                resetCoin()
                adsForLives.position.y = size.height/2 - 100
                UserDefaults.standard.set(0, forKey:"Lives")
                GlobalPlayer.sharedInstance.gameLives = self.lives
            }
            if(self.lives < 5)
            {
                self.adsForLives.zPosition = 3
                adsForLives.position.y = size.height/2 - 150
            }
//            if(self.lives == 0)
//            {
//            if(self.lives == 4)
//         {
//                UserDefaults.standard.set(Date(), forKey:"creationTime")
//                print("Date1 ddd")
//            }
               // UserDefaults.standard.set(Date(), forKey:"creationTime")

            //}
            //livesLeft.zPosition = 3
        }

        if(Int(coin.position.x) == Int(MainGuy.position.x+3) && coin.position.y-MainGuy.position.y <= 25 && coin.position.y-MainGuy.position.y >= 0)
        {
            coin.zPosition = -1
            self.coinAmount += 1
            myLabel.text = String(self.coinAmount)
        }
        
        if(Int(coin1.position.x) == Int(MainGuy.position.x+3) && coin1.position.y-MainGuy.position.y <= 25 && coin1.position.y-MainGuy.position.y >= 0)
        {
            coin1.zPosition = -1
            self.coinAmount += 1
            myLabel.text = String(self.coinAmount)
        }
        
        if(Int(coin2.position.x) == Int(MainGuy.position.x+3) && coin2.position.y-MainGuy.position.y <= 25 && coin2.position.y-MainGuy.position.y >= 0)
        {
            coin2.zPosition = -1
            self.coinAmount += 1
            myLabel.text = String(self.coinAmount)
        }
        
        
        if(Int(coin3.position.x) == Int(MainGuy.position.x+3) && coin3.position.y-MainGuy.position.y <= 25 && coin3.position.y-MainGuy.position.y >= 0 )
        {
            coin3.zPosition = -1
            self.coinAmount += 1
            myLabel.text = String(self.coinAmount)
        }
        
        if(Int(coin.position.x) == Int(MainGuy.position.x+3)
           && coin.position.y-MainGuy.position.y >= -25 && coin.position.y-MainGuy.position.y <= 0)
        {
            coin.zPosition = -1
            self.coinAmount += 1
            myLabel.text = String(self.coinAmount)
        }

        if(Int(coin1.position.x) == Int(MainGuy.position.x+3)
           && coin1.position.y-MainGuy.position.y >= -25 && coin1.position.y-MainGuy.position.y <= 0)
        {
            coin1.zPosition = -1
            self.coinAmount += 1
            myLabel.text = String(self.coinAmount)
        }


        if(Int(coin2.position.x) == Int(MainGuy.position.x+3)
           && coin2.position.y-MainGuy.position.y >= -25 && coin2.position.y-MainGuy.position.y <= 0)
        {
            coin2.zPosition = -1
            self.coinAmount += 1
            myLabel.text = String(self.coinAmount)
        }
        
        if(Int(coin3.position.x) == Int(MainGuy.position.x+3)
          && coin3.position.y-MainGuy.position.y >= -25 && coin3.position.y-MainGuy.position.y <= 0)
        {
            coin3.zPosition = -1
            self.coinAmount += 1
            myLabel.text = String(self.coinAmount)
        }
        
       // print(rock.position.x)
        print(MainGuy
                .position.x)
        print(rock.position.x)
//        print(box1.position.x)
//        print(trashCan.position.x)
        //}


        
    }
}




struct MainGame: View {
    
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
    //let lives : Int 
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.presentationMode) var presentationMode
    @State var showText = UserDefaults.standard.bool(forKey: "gameTuto")
    
//    func updateLives(newLive : Int)
//    {
//        let docRef = db.collection("Users").document(uid)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                let ref = self.db.collection("Users").document(self.uid).setData([ "Lives" : newLive ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added1")
//
//                                }
//                            }
//            }
//            else {
//                print("Document does not exist")
//            }
//        }
//    }
    
    var body: some View {
        ZStack{
            if(self.showText == true)
            {
          StoryText()//.frame(width: UIScreen.main.bounds.width-100, height: UIScreen.main.bounds.height-100)
                .zIndex(1).padding(.bottom, 150)
                .onTapGesture {self.showText = false}
            }
            
            SpriteView(scene: GameScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))).ignoresSafeArea()
        
            //StoryText()
        
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button("Back"){self.presentationMode.wrappedValue.dismiss()})
              
//            .onReceive(timer) { _ in
//                if (GlobalPlayer.sharedInstance.timeTilLife > 0 && GlobalPlayer.sharedInstance.gameLives < 5) {
//                    GlobalPlayer.sharedInstance.timeTilLife -= 1
//                }
//else if(GlobalPlayer.sharedInstance.timeTilLife == 0)
//{
//    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
//}
          //  }
            .onAppear(perform: {
                

                GlobalPlayer.sharedInstance.shuffleGameSong()
                        
//              let lives =  UserDefaults.standard.integer(forKey:"Lives")
//                if let date = UserDefaults.standard.object(forKey: "creationTime") as? Date {
//                    if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 1 {
//                        if(lives + 1 <= 5)
//                        {
//                            let new = lives + 1
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                    }
//                    if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 2 {
//                        if(lives + 2 <= 5)
//                        {
//                            let new = lives + 2
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 1 <= 5)
//                        {
//                            let new = lives + 1
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                    }
//                    if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 3 {
//                        //do something
//                        if(lives + 3 <= 5)
//                        {
//                            let new = lives + 3
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 2 <= 5)
//                        {
//                            let new = lives + 2
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 1 <= 5)
//                        {
//                            let new = lives + 1
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                    }
//                    if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 4 {
//                        //do something
//                        if(lives + 4 <= 5)
//                        {
//                            let new = lives + 4
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 3 <= 5)
//                        {
//                            let new = lives + 3
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 2 <= 5)
//                        {
//                            let new = lives + 2
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 1 <= 5)
//                        {
//                            let new = lives + 1
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                    }
//                    if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 5 {
//                        //do something
//                        if(lives + 5 <= 5)
//                        {
//                            let new = lives + 5
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 4 <= 5)
//                        {
//                            let new = lives + 4
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 3 <= 5)
//                        {
//                            let new = lives + 3
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 2 <= 5)
//                        {
//                            let new = lives + 2
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                        else if(lives + 1 <= 5)
//                        {
//                            let new = lives + 1
//                            UserDefaults.standard.set(new, forKey:"Lives")
//                            self.updateLives(newLive: new)
//                            UserDefaults.standard.set(Date(), forKey:"creationTime")
//                        }
//                    }
//                }
            })
            .onDisappear(perform: {
                

                if(GlobalPlayer.sharedInstance.gameMusicPlayer != nil)
                {
                GlobalPlayer.sharedInstance.gameMusicPlayer.stop()
                }
            })

    }
}



struct MainGame_Previews: PreviewProvider {
    static var previews: some View {
        MainGame()
    }
}
