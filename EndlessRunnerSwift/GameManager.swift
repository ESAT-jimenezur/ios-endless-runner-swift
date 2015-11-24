//
//  GameManager.swift
//  EndlessRunnerSwift
//
//  Created by Jose Luis Jimenez on 24/11/15.
//  Copyright © 2015 ESAT. All rights reserved.
//

import Foundation

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
        current_scene_ = SCENE.SCENE_MENU.rawValue;
    };
    
    func start_scene(scene : Int){
        print("Start Scene \(scene)")
        current_scene_ = scene
    }
    
    func current_scene() -> Int{
        return current_scene_;
    }
    
}