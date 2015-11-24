//
//  GameViewController.swift
//  EndlessRunnerSwift
//
//  Created by Marcos Martí Nacher on 2/11/15.
//  Copyright (c) 2015 ESAT. All rights reserved.
//


import UIKit
import SpriteKit


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


		// Configure the view.
		let skView = self.view as! SKView
		skView.showsFPS = true
		skView.showsNodeCount = true
            
		/* Sprite Kit applies additional optimizations to improve rendering performance */
		skView.ignoresSiblingOrder = true
		
        let current_scene = GameManager.Instance.current_scene();
        
        switch current_scene {
        case GameManager.SCENE.SCENE_MENU.rawValue:
            let scene = MenuScene(size: CGSizeMake(960, 640))
            scene.scaleMode = .AspectFill
            skView.presentScene(scene)
            break;
        case GameManager.SCENE.SCENE_GAME.rawValue:
            let scene = GameScene(size: CGSizeMake(960, 640))
            scene.scaleMode = .AspectFill
            skView.presentScene(scene)
        default:
            break;
        }
        
		//let scene = GameScene(size: CGSizeMake(960, 640))
		/* Set the scale mode to scale to fit the window */

    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .Landscape
        } else {
            return .Landscape
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
