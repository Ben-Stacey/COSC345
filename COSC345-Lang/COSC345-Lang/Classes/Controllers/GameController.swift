//
//  GameController.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//

import Foundation
import UIKit

class GameController {
    var gameView: UIView!
    var level: Level!
    private var tiles = [TileView]()
    private var targets = [TargetView]()
    
    init(){
    }
    
    func dealRandomSentence(){
        assert(level.sentence.count > 0, "no level loaded")
        
        let randomIndex = randomNumber(minX: 0, maxX: UInt32(level.sentence.count-1))
        let sentencePair = level.sentence[randomIndex]
        
        let sentence1 = sentencePair[0] as! String
        let sentence2 = sentencePair[1] as! String
        
        let sentence1Length = sentence1.count
        let sentence2Length = sentence2.count
        
        print("phrase1[\(sentence1Length)]: \(sentence1)")
        print("phrase2[\(sentence1Length)]: \(sentence2)")
        
        let tileSide = ceil(ScreenWidth * 0.9 / CGFloat(max(sentence1Length, sentence2Length))) - TileMargin
        
        var xOffset = (ScreenWidth - CGFloat(max(sentence1Length, sentence2Length)) * (tileSide + TileMargin)) / 2.0
        
        xOffset += tileSide / 2.0
        
        targets = []
        
        for (index, letter) in sentence2.enumerated(){
            if letter != " " {
                let target = TargetView(letter: letter, sideLength: tileSide)
                target.center = CGPoint(x: xOffset + CGFloat(index) * (tileSide + TileMargin), y: ScreenHeight/4)
                
                gameView.addSubview(target)
                targets.append(target)
            }
        }
        
        tiles = []
            
        for (index, letter) in sentence1.enumerated() {
          if letter != " " {
            let tile = TileView(letter: letter, sideLength: tileSide)
              tile.randomize()
              tile.center = CGPoint(x: xOffset + CGFloat(index)*(tileSide + TileMargin), y: ScreenHeight/4*3)
                
            gameView.addSubview(tile)
            tiles.append(tile)
          }
        }
    }
}
