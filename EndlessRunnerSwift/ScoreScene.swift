//
//  ScoreScene.swift
//  EndlessRunnerSwift
//
//  Created by Jose Luis Jimenez on 24/11/15.
//  Copyright © 2015 ESAT. All rights reserved.
//

import Foundation
import SpriteKit

class ScoreScene: SKScene {
    
    let times_to_press_to_play = 3
    var times_pressed_to_play = 0;
    let press_to_play = SKLabelNode(fontNamed: "zapfino")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Set backgroun color
        self.backgroundColor = SKColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1)
        

        
        // Pause label
        let died_label = SKLabelNode(fontNamed:"zapfino")
        died_label.text = "You Died!";
        died_label.fontSize = 60;
        died_label.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidX(self.frame));
        self.addChild(died_label)
        
        // Score from settings
        let settings = NSUserDefaults.standardUserDefaults()
        if let score = settings.stringForKey("score") {
            // Score label
            let score_label = SKLabelNode(fontNamed: "zapfino")
            score_label.text = "Your Score: \(score)"
            score_label.fontSize = 30;
            score_label.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
            self.addChild(score_label)
        }
        if let hiscore = settings.stringForKey("hiscore") {
            // Score label
            let hiscore_label = SKLabelNode(fontNamed: "zapfino")
            hiscore_label.text = "Best Score: \(hiscore)"
            hiscore_label.fontSize = 30;
            hiscore_label.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 100);
            self.addChild(hiscore_label)
        }
        
        
        press_to_play.text = "Press \(times_to_press_to_play) times to exit to menu. \(times_pressed_to_play) pressed"
        press_to_play.fontSize = 20;
        press_to_play.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 150);
        self.addChild(press_to_play)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //* Called when a touch ends */
        for touch: UITouch in touches {
            times_pressed_to_play = times_pressed_to_play + 1
            press_to_play.text = "Press \(times_to_press_to_play) times to exit to menu. \(times_pressed_to_play) pressed"
            if times_pressed_to_play >= times_to_press_to_play {
                GameManager.Instance.start_scene(view!, scene: GameManager.SCENE.SCENE_MENU.rawValue);
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
