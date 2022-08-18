//
//  TargetView.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//

import Foundation
import UIKit

class TargetView: UIImageView {
    var letter:Character
    
    required init(coder aDecoder:NSCoder) {
      fatalError("use init(letter:, sideLength:")
    }
    
    init(letter:Character, sideLength:CGFloat) {
      self.letter = letter
      let image = UIImage(named: "slot")!
      super.init(image:image)
      let scale = sideLength / image.size.width
        self.frame = CGRect(x: 0,y: 0,width: image.size.width * scale,height: image.size.height * scale)
    }
}
