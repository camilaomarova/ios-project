//
//  MenuScene.swift
//  SpacegameReloaded
//
//  Created by user on 24.11.17.
//  Copyright © 2017 KBTU. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    var newGameButtonNode:SKSpriteNode!
    var difficultyButtonNode:SKSpriteNode!
    var difficultyLabelNode: SKLabelNode!
    
    override func didMove(to view: SKView) {
        newGameButtonNode    = self.childNode(withName: "newGameButton") as! SKSpriteNode
        difficultyButtonNode = self.childNode(withName: "difficultyButton") as! SKSpriteNode
        
        difficultyButtonNode.texture = SKTexture(imageNamed: "difficultyButton")
        difficultyLabelNode          = self.childNode(withName: "difficultyLabel") as! SKLabelNode
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "hard") {
            difficultyLabelNode.text = "Hard"
        } else {
            difficultyLabelNode.text = "Easy"
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    	
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameButton" {
                
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene  = GameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
                
            } else if nodesArray.first?.name == "difficultyButton" {
                
                changeDifficulty()
                
            }
        }
    }
    
    func changeDifficulty() {
        
        let userDefaults = UserDefaults.standard
        
        if difficultyLabelNode.text == "Easy" {
            
            difficultyLabelNode.text = "Hard"
            userDefaults.set(true, forKey: "hard")
            
        } else {
            
            difficultyLabelNode.text = "Easy"
            userDefaults.set(true, forKey: "easy")
            
        }
        
        userDefaults.synchronize()
        
    }
}
