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
    
    /**
        Init shouldnt be called and if it is diaplays the fatal error
    */
    required init(coder aDecorder:NSCoder){
        fatalError("use init(frame:")
    }
    
    /**
        Enables the user interaction for the HUD on the game
        - Parameters:
            - frame: [in] This is the frame of HUD to be displayed in the game
    */
    override init(frame:CGRect){
        super.init(frame:frame)
        self.isUserInteractionEnabled = true
    }
}

