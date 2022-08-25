//
//  Config.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//

import Foundation
import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

let TileMargin: CGFloat = 20.0

/**
    Randomly generates a number that between the two limits
    - Parameters:
        - minX: [in] lower limit of the random number
        - maxX: [in] upper limit of the random number
    - Returns:
        - Int(result): returns the randomly generated number
*/
func randomNumber(minX:UInt32, maxX:UInt32) -> Int {
  let result = (arc4random() % (maxX - minX + 1)) + minX
  return Int(result)
}
