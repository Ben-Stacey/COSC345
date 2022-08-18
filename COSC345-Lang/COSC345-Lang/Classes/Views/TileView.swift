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
    private var tempTransform = CGAffineTransform.identity
    
    required init(coder aDecoder: NSCoder){
        fatalError("user init(letter, sideLength")
    }
    
    // Create a new tile
    init(letter:Character, sideLength:CGFloat){
        self.letter = letter
        let image = UIImage(named: "tile")!
        super.init(image:image)
        
        let scale = sideLength / image.size.width
        self.frame = CGRect(x: 0, y: 0, width: image.size.width * scale, height: image.size.height * scale)
        
        // Adding character (will be changed to word shortly)
        let letterLabel = UILabel(frame: self.bounds)
        letterLabel.textAlignment = NSTextAlignment.center
        letterLabel.textColor = UIColor.white
        letterLabel.backgroundColor = UIColor.clear
        letterLabel.text = String(letter).uppercased()
        letterLabel.font = UIFont(name: "Verdana-Bold", size: 78.0*scale)
        self.addSubview(letterLabel)
        self.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as? UITouch{
            let point = touch.location(in: self.superview)
            xOffset = point.x - self.center.x
            yOffset = point.y - self.center.y
            
            tempTransform = self.transform
            self.transform = self.transform.scaledBy(x: 1.2, y: 1.2)
            self.superview?.bringSubviewToFront(self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as? UITouch {
            let point = touch.location(in: self.superview)
            self.center = CGPoint(x: point.x - xOffset, y: point.y - yOffset)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchesMoved(touches, with: event)
        self.transform = tempTransform
        dragDelegate.tileView(self, didDragToPoint: self.center)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = tempTransform
    }
}
