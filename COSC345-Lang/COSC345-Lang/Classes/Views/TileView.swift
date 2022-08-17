//
//  TileView.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//

import Foundation
import UIKit

protocol TileDragDelegateProtocol{
    func tileView(tileView: TileView, didDragToPoint: CGPoint)
}

class TileView:UIImageView {
    var letter: Character
    var isMatched: Bool = false
    private var xOffset = 0.0
    private var yOffset = 0.0
    var tile: TileDragDelegateProtocol
    private var tempTransform: CGAffineTransform = CGAffineTransformIdentity
    
    required init(coder aDecoder: NSCoder){
        fatalError("user init(letter, sideLength")
    }
    
    // Create a new tile
    init(letter:Character, sideLength:CGFloat){
        self.letter = letter
        let background = UIImage(named: "tile")
        super.init(image:background)
        
        // Rescalling the tile
        let scale = sideLength / background.size.width
        self.frame = CGRect(x: 0, y: 0, width: background.size.width * scale, height: background.size.height * scale)
        
        // Adding character (will be changed to word shortly)
        let letterLabel = UILabel(frame, self.bounds)
        letterLabel.textAlignment = NSTextAlignment.center
        letterLabel.textColor = UIColor.white
        letterLabel.backgroundColor = UIColor.clear
        letterLabel.text = String(letter).uppercased()
        letterLabel.font = UIFont(name: "Verdana-Bold", size: 78.0*scale)
        self.addSubview(letterLabel)
        
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch{
            let point = touch.locationInView(self.superview)
            xOffset = point.x - self.center.x
            yOffset = point.y - self.center.y
            
            tempTransform = self.transform
            self.transform = CGAffineTransformScale(self.transform, 1.2, 1.2)
            self.superview?.bringSubviewToFront(self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchesMoved(touches, withEvent: event)
        self.transform = tempTransform
        dragDelegate?.tileView(self, didDragToPoint: self.center)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch {
            let point = touch.locationInView(self.superview)
            self.center = CGPointMake(point.x - xOffset, point.y - yOffset)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = tempTransform
    }
}