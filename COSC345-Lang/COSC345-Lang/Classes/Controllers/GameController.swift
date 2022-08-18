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
  
  private var data = GameData()
  
  var onAnagramSolved:( () -> ())!
  
  func dealRandomAnagram () {
    assert(level.anagrams.count > 0, "no level loaded")
    
    let randomIndex = randomNumber(minX:0, maxX:UInt32(level.anagrams.count-1))
    let anagramPair = level.anagrams[randomIndex]
    
    let anagram1 = anagramPair[0] as! String
    let anagram2 = anagramPair[1] as! String
    
    let anagram1length = anagram1.count
    let anagram2length = anagram2.count
    
    print("phrase1[\(anagram1length)]: \(anagram1)")
    print("phrase2[\(anagram2length)]: \(anagram2)")
    
    let tileSide = ceil(ScreenWidth * 0.9 / CGFloat(max(anagram1length, anagram2length))) - TileMargin

    var xOffset = (ScreenWidth - CGFloat(max(anagram1length, anagram2length)) * (tileSide + TileMargin)) / 2.0
    
    xOffset += tileSide / 2.0
    
    targets = []
    
    for (index, letter) in anagram2.enumerated(){
      if letter != " " {
        let target = TargetView(letter: letter, sideLength: tileSide)
          target.center = CGPoint( x: xOffset + CGFloat(index)*(tileSide + TileMargin), y: ScreenHeight/4)
        
        gameView.addSubview(target)
        targets.append(target)
      }
    }

    tiles = []
    
      for (index, letter) in anagram1.enumerated() {
      if letter != " " {
        let tile = TileView(letter: letter, sideLength: tileSide)
          tile.center = CGPoint(x: xOffset + CGFloat(index)*(tileSide + TileMargin), y: ScreenHeight/4*3)
        tile.dragDelegate = self
        gameView.addSubview(tile)
        tiles.append(tile)
      }
    }
  }
  
  func placeTile(tileView: TileView, targetView: TargetView) {
     targetView.isMatched = true
     tileView.isMatched = true
    
      tileView.isUserInteractionEnabled = false
    
      UIView.animate(withDuration: 0.35,
      delay:0.00,
      options:UIView.AnimationOptions.curveEaseOut,
      animations: {
        tileView.center = targetView.center
        tileView.transform = CGAffineTransform.identity
      },
      completion: {
        (value:Bool) in
          targetView.isHidden = true
    })
  }
  
  func checkForSuccess() {
    for targetView in targets {
      //no success, bail out
      if !targetView.isMatched {
        return
      }
    }
    print("Game Over!")
    
    self.clearBoard()
    self.onAnagramSolved()
  }
  
  func clearBoard() {
    tiles.removeAll(keepingCapacity: false)
    targets.removeAll(keepingCapacity: false)
    
    for view in gameView.subviews  {
      view.removeFromSuperview()
    }
  }
}

extension GameController:TileDragDelegateProtocol {
  func tileView(tileView: TileView, didDragToPoint point: CGPoint) {
    var targetView: TargetView?
    for tv in targets {
      if tv.frame.contains(point) && !tv.isMatched {
        targetView = tv
        break
      }
    }
    
    if let targetView = targetView {
      if targetView.letter == tileView.letter {
        self.placeTile(tileView:tileView, targetView: targetView)
        self.checkForSuccess()
      }
    }
  }
}
