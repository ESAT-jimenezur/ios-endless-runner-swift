//
//  GameScene.swift
//  EndlessRunnerSwift
//
//  Created by Marcos Martí Nacher on 2/11/15.
//  Copyright (c) 2015 ESAT. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
		/* Setup your scene here */
		
		// Set backgroun color
		self.backgroundColor = SKColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1)
		
		
		
    }
	
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		//* Called when a touch ends */
		for touch: UITouch in touches {
			let location = touch.locationInNode(self)
		}
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
