//
//  Level.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//

import Foundation
struct Level {
  //let pointsPerTile: Int
  //let timeToSolve: Int
  let sentence: [NSArray]
  
  init(levelNumber: Int) {
    let fileName = "level\(levelNumber).plist"
    let levelPath = "\(Bundle.main.resourcePath!)/\(fileName)"
    let levelDictionary: NSDictionary? = NSDictionary(contentsOfFile: levelPath)
    assert(levelDictionary != nil, "Level configuration file not found")
    //self.pointsPerTile = levelDictionary!["pointsPerTile"] as! Int
    //self.timeToSolve = levelDictionary!["timeToSolve"] as! Int
    self.sentence = levelDictionary!["sentence"] as! [NSArray]
  }
}
