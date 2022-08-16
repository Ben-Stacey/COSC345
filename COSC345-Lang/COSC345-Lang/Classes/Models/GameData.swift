//
//  GameData.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//
import Foundation

class GameData {
  //store the user's game achievement
  var points:Int = 0 {
    didSet {
      //custom setter - keep the score positive
      points = max(points, 0)
    }
  }
}
