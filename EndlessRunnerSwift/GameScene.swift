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
    var total_missiles = 10
    var clouds = Array<SKSpriteNode>()
    var missiles = Array<SKSpriteNode>()
    

    let score_label = SKLabelNode(fontNamed:"zapfino")
    var is_touching = false
    var score_counter = 0;
    
    override func didMoveToView(view: SKView) {
		/* Setup your scene here */
		
        // Clouds creation
        for var i = 0; i <= total_clouds; ++i {
            print("Creating cloud: \(i)")
            let cloud = SKSpriteNode(imageNamed:"sprite_cloud")
            let rand_posy : CGFloat = CGFloat(rand() % 1000)
            let rand_posx : CGFloat = CGFloat(rand() % 1000)
            cloud.position = CGPointMake(rand_posx, rand_posy)
            cloud.zPosition = CGFloat(rand() % 10)
            clouds.append(cloud);
            view.scene!.addChild(cloud);
        }
        
        // Missiles creation
        for var i = 0; i <= total_missiles; ++i {
            print("Creating missile: \(i)")
            let missile = SKSpriteNode(imageNamed:"sprite_missile")
            let rand_posy : CGFloat = CGFloat(rand() % 1000)
            let rand_posx : CGFloat = CGFloat(2000 + rand() % 1200)
            missile.position = CGPointMake(rand_posx, rand_posy)
            missile.xScale = -0.1;
            missile.yScale = 0.1;
            missiles.append(missile);
            view.scene!.addChild(missile);
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
    
        // Cloud movement
        for var i = 0; i <= total_clouds; ++i {
            clouds[i].position = CGPointMake(clouds[i].position.x - 3.0, clouds[i].position.y);
            if clouds[i].position.x <= -100.0 {
                clouds[i].position.x += 1050 + CGFloat(rand() % 300)
            }
        }
        
        // Missile movement
        for var i = 0; i <= total_missiles; ++i {
            missiles[i].position = CGPointMake(missiles[i].position.x - 6.0, missiles[i].position.y);
            if missiles[i].position.x <= -100.0 {
                missiles[i].position.x += 1050 + CGFloat(rand() % 300)
            }
            // Check collision
            if missiles[i].position.x > player.position.x && missiles[i].position.x < player.position.x + player.frame.size.width
            && missiles[i].position.y > player.position.y && missiles[i].position.y < player.position.y + player.frame.size.height{
                print("Collision: Player dead")
                let settings = NSUserDefaults.standardUserDefaults()
                settings.setValue(score_counter, forKey:"score")
                
                
                let old_hiscore = settings.valueForKey("hiscore") as? Int;
                
                if score_counter > old_hiscore {
                    settings.setValue(score_counter, forKey: "hiscore")
                }
                
                settings.synchronize()
                GameManager.Instance.start_scene(view!, scene: GameManager.SCENE.SCENE_SCORE.rawValue);
            }
        }
        
    }
}
