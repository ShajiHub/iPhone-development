//
//  kidRunScene.swift
//  SnackyWackyProj
//
//  Created by user215686 on 3/9/22.
//

import UIKit
import SpriteKit
import GameplayKit

class kidRunScene: SKScene {
    
    var kidFrames:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
     
        }
        
        override init(size: CGSize){
            
            super.init(size: size)
            self.backgroundColor = UIColor.yellow
            
            var frames:[SKTexture] = []
            
            let kidAnim = SKTextureAtlas(named: "active")
            
            for index in 1...18{
                let imgName = "active\(index)"
                let kidImg = kidAnim.textureNamed(imgName)
                frames.append(kidImg)
            }
            
            self.kidFrames = frames
        }
    
        func showKidRun(){
            
            let texture = self.kidFrames![0]
            
            let kid = SKSpriteNode(texture: texture)
            
            kid.size = CGSize(width: 80, height: 80)
            
            let randomYPositionForKid = GKRandomDistribution(lowestValue: 60, highestValue: Int(self.frame.size.height)) //random value
            
            
            let yPosition = CGFloat(randomYPositionForKid.nextInt())
            
            let rightToleft = arc4random() % 2 == 0
            
            let xPosition = rightToleft ? self.frame.size.width + kid.size.width / 2 : -kid.size.width / 2
            
            kid.position = CGPoint(x: xPosition, y: yPosition)
            
            if rightToleft {
                kid.xScale = -1
            }
            
            self.addChild(kid)
            
            kid.run(SKAction.repeatForever(SKAction.animate(with: self.kidFrames!, timePerFrame: 0.05, resize: false, restore: true)))
            
            var distanceToCover = self.frame.size.width + kid.size.width
            
            if rightToleft {
                distanceToCover *= -1
            }
            
            let time = TimeInterval(abs(distanceToCover / 140))
            
            let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: time)
            
            let removeAction = SKAction.run {
                kid.removeAllActions()
                kid.removeFromParent()
            }
            
            let allActions = SKAction.sequence([moveAction, removeAction])
            
            kid.run(allActions)
        }
        
    
    func showKidOppRun(){
        let texture = self.kidFrames![0]
        
        let kid = SKSpriteNode(texture: texture)
        
        kid.size = CGSize(width: 50, height: 50)
        
        let randomYPositionForKid = GKRandomDistribution(lowestValue: 40, highestValue: Int(self.frame.size.height)) //random value
        
        
        let yPosition = CGFloat(randomYPositionForKid.nextInt())
        
        let rightToleft = arc4random() % 2 == 0
        
        let xPosition = rightToleft ? self.frame.size.width + kid.size.width / 2 : -kid.size.width / 2
        
        kid.position = CGPoint(x: xPosition, y: yPosition)
        
        if rightToleft {
            kid.xScale = -1
        }
        
        self.addChild(kid)
        
        kid.run(SKAction.repeatForever(SKAction.animate(with: self.kidFrames!, timePerFrame: 0.05, resize: false, restore: true)))
        
        var distanceToCover = self.frame.size.width + kid.size.width
        
        if rightToleft {
            distanceToCover *= -1
        }
        
        let time = TimeInterval(abs(distanceToCover / 140))
        
        let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: time)
        
        let removeAction = SKAction.run {
            kid.removeAllActions()
            kid.removeFromParent()
        }
        
        let allActions = SKAction.sequence([moveAction, removeAction])
        
        kid.run(allActions)
    }

}

