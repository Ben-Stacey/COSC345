//
//  HUDView.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//

import Foundation
import UIKit

class HUDView: UIView {
  //var stopwatch: StopwatchView
  //var gamePoints: CounterLabelView
  //hintButton: UIButton!
    
    required init(coder aDecorder:NSCoder){
        fatalError("use init(frame:")
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        self.isUserInteractionEnabled = true
    }
    
    override func hitTest(pointL CGPoint, withEvent event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(pointL: CGPoint, withEvent: event)
        
        if hitView is UIButton{
            return hitView
        }
        return nil
    }
}

