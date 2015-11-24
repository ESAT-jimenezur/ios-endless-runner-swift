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
    var total_clouds = 15
    var clouds = Array<SKSpriteNode>()
    

    let score_label = SKLabelNode(fontNamed:"zapfino")
    var is_touching = false
    var score_counter = 0;
    
    override func didMoveToView(view: SKView) {
		/* Setup your scene here */
		
        
        for var i = 0; i < total_clouds; ++i {
            print("Creating cloud: \(i)")
            let cloud = SKSpriteNode(imageNamed:"sprite_cloud")
            let rand_posy : CGFloat = CGFloat(rand() % 1000)
            let rand_posx : CGFloat = CGFloat(rand() % 1000)
            cloud.position = CGPointMake(rand_posx, rand_posy)
            clouds.append(cloud);
            view.scene!.addChild(cloud);
        }
        
        
		// Set background color
		self.backgroundColor = SKColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1)
		
		// Player Sprite
        player.position = CGPointMake(100, 320)
        player.xScale = -0.25;
        player.yScale = 0.25;
        view.scene!.addChild(player)
        
        // Score label
        score_label.text = "0";
        score_label.fontSize = 20;
        score_label.position = CGPoint(x:150, y:CGRectGetHeight(self.frame) - 50);
        view.scene!.addChild(score_label)
		
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
        score_counter++;
        score_label.text = "Score:   \(score_counter)";
        
        if !is_touching {
            // Do Gravity (Heli)
            player.position = CGPointMake(player.position.x, player.position.y - 2.5);
        }else{
            // Push heli to top
            player.position = CGPointMake(player.position.x, player.position.y + 5);
        }
    
        for var i = 0; i < total_clouds; ++i {
            clouds[i].position = CGPointMake(clouds[i].position.x - 3.0, clouds[i].position.y);
            if clouds[i].position.x <= -100.0 {
                clouds[i].position.x += 1050 + CGFloat(rand() % 300)
            }
        }
    }
}
