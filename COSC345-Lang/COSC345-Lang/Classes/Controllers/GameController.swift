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
    
    init(){
        
    }
    
    func dealRandomSentence(){
        assert(level.sentence.count > 0, "no level looded")
        
        let randomIndex = randomNumber(minX: 0, maxX: UInt32(level.sentence.count-1))
        let sentencePair = level.sentence[randomIndex]
        
        let sentence1 = sentencePair[0] as! String
        let sentence2 = sentencePair[1] as! String
        
        let sentence1Length = sentence1.count
        let sentence2Length = sentence2.count
        
        print("phrase1[\(sentence1Length)]: \(sentence1)")
        print("phrase2[\(sentence1Length)]: \(sentence2)")
    }
}
