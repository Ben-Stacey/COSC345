//
//  TargetView.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 16/08/22.
//

import Foundation
import UIKit

class TargetView: UIImageView {
    required init(coder aDecoder:NSCoder) {
      fatalError("use init(letter:, sideLength:")
    }
    
    init(letter:Character, sideLength:CGFloat) {
      self.letter = letter
      let image = UIImage(named: "slot")!
      super.init(image:image)
      let scale = sideLength / image.size.width
      self.frame = CGRectMake(0, 0, image.size.width * scale, image.size.height * scale)
    }
}
