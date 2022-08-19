//
//  TileView.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//

import Foundation
import UIKit

class TileView:UIImageView{
    var letter: Character
    var isMatched: Bool = false
    
    required init(coder aDecorder:NSCoder){
        fatalError("use other init")
    }
    
    init(letter:Character, sideLength:CGFloat){
        self.letter = letter
        let image = UIImage(named: "tile")!
        super.init(image:image)
        let scale = sideLength / image.size.width
        self.frame = CGRect(x: 0, y: 0, width: image.size.width * scale, height: image.size.height * scale)
        
        let letterLabel = UILabel(frame: self.bounds)
        letterLabel.textAlignment = NSTextAlignment.center
        self.addSubview(letterLabel)
    }
    
    func randomize(){
        let rotation = CGFloat(randomNumber(minX: 0, maxX: 50)) / 100.0 - 0.2
        self.transform = CGAffineTransform(rotationAngle: rotation)
        let yOffset = CGFloat(randomNumber(minX: 0, maxX: 10) - 10)
        self.center = CGPoint(x: self.center.x, y: self.center.y + yOffset)
    }
}
