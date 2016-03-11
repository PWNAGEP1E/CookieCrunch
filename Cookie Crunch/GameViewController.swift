//
//  GameViewController.swift
//  Cookie Crunch
//
//  Created by jeremy on 3/3/16.
//  Copyright (c) 2016 Indicane. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: GameScene!
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        scene.swipeHandler = handleSwipe
        level = Level(filename: "Level_1")
        scene.level = level
        scene.addTiles()
        skView.presentScene(scene)
        beginGame()
    }
    func beginGame() {
        shuffle()
    }
    var level: Level!
    func shuffle() {
        let newCookies = level.shuffle()
        scene.addSpritesForCookies(newCookies)
    }
    func handleSwipe(swap: Swap) {
        view.userInteractionEnabled = false
        
        if level.isPossibleSwap(swap) {
            level.performSwap(swap)
            scene.animateSwap(swap) {
                self.view.userInteractionEnabled = true
            }
        } else {
            scene.animateInvalidSwap(swap) {
                self.view.userInteractionEnabled = true
            }
        }
    }
}