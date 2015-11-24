//
//  MenuScene.swift
//  EndlessRunnerSwift
//
//  Created by Jose Luis Jimenez on 24/11/15.
//  Copyright © 2015 ESAT. All rights reserved.
//

import Foundation
import SpriteKit

class MenuScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Set backgroun color
        self.backgroundColor = SKColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1)
        
        
        // Pause label
        let pauseLabel = SKLabelNode(fontNamed:"zapfino")
        pauseLabel.text = "EndlessRunner";
        pauseLabel.fontSize = 60;
        pauseLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidX(self.frame));
        
        // Press anywhere to play label
        let pressToPlayLabel = SKLabelNode(fontNamed: "zapfino")
        pressToPlayLabel.text = "Press anywhere to play";
        pressToPlayLabel.fontSize = 30;
        pressToPlayLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidX(self.frame) - 200);
        
        self.addChild(pauseLabel)
        self.addChild(pressToPlayLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //* Called when a touch ends */
        for touch: UITouch in touches {
            //let location = touch.locationInNode(self)
            GameManager.Instance.start_scene(view!, scene: GameManager.SCENE.SCENE_GAME.rawValue);
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
