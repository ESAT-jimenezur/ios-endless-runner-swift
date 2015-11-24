//
//  GameManager.swift
//  EndlessRunnerSwift
//
//  Created by Jose Luis Jimenez on 24/11/15.
//  Copyright © 2015 ESAT. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GameManager {
    
    
    static let Instance = GameManager()
    
    enum SCENE : Int{
        case SCENE_MENU = 0,
        SCENE_GAME,
        SCENE_SCORE,
        NUMBER_OF_SCENES
    }
    
    var current_scene_: Int;
    
    init() {
        print("Game Started");
        current_scene_ = SCENE.SCENE_GAME.rawValue; // CHANGE THIS
    };
    
    func start_scene(view: SKView, scene : Int){
        print("Start Scene \(scene)")
        current_scene_ = scene
        switch scene{
        case SCENE.SCENE_MENU.rawValue:
            let scene = MenuScene(size: CGSizeMake(960, 640))
            scene.scaleMode = .AspectFill
            view.presentScene(scene)
            break;
        case SCENE.SCENE_GAME.rawValue:
            let scene = GameScene(size: CGSizeMake(960, 640))
            scene.scaleMode = .AspectFill
            view.presentScene(scene)
            break;
        case SCENE.SCENE_SCORE.rawValue:
            let scene = ScoreScene(size: CGSizeMake(960, 640))
            scene.scaleMode = .AspectFill
            view.presentScene(scene)
            break;
        default:
            break;
        }
        
    }
    
    func current_scene() -> Int{
        return current_scene_;
    }
    
}