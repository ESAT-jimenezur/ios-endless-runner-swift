//
//  GameScene.swift
//  EndlessRunnerSwift
//
//  Created by Marcos Martí Nacher on 2/11/15.
//  Copyright (c) 2015 ESAT. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let player = SKSpriteNode(imageNamed:"sprite_player")
    var is_touching = false
    
    
    override func didMoveToView(view: SKView) {
		/* Setup your scene here */
		
		// Set backgroun color
		self.backgroundColor = SKColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1)
		
		
        player.position = CGPointMake(100, 320)
        player.xScale = -0.25;
        player.yScale = 0.25;
        view.scene!.addChild(player)
		
    }
	
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		//* Called when a touch ends */
		for touch: UITouch in touches {
			//let location = touch.locationInNode(self)
            is_touching = true;
		}
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: UITouch in touches {
            is_touching = false;
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        if !is_touching {
            // Do Gravity (Heli)
            player.position = CGPointMake(player.position.x, player.position.y - 2.5);
        }else{
            // Push heli to top
            player.position = CGPointMake(player.position.x, player.position.y + 5);
        }
    }
}
