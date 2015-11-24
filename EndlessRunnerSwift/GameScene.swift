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
		self.backgroundColor = SKColor.lightGrayColor()
		
		
		// Pause label
		let pauseLabel = SKLabelNode(fontNamed:"Chalkduster")
		pauseLabel.text = "EndlessRunner";
		pauseLabel.fontSize = 35;
		pauseLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
		
		self.addChild(pauseLabel)
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
