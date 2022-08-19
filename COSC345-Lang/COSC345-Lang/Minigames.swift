//
//  Minigames.swift
//  
//
//  Created by Liam Flynn on 12/08/22.
//
import UIKit

class ViewController: UIViewController {
    
    var language = ""
    
    private let controller:GameController
    
    required init(coder aDecorder: NSCoder){
        controller = GameController()
        super.init(coder: aDecorder)!
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
        let level1 = Level(levelNumber: 1)
        print("Tower: \(level1.sentence)")
        
        super.viewDidLoad()
        let gameView = UIView(frame: CGRect(x:0, y: 0, width: ScreenWidth, height: ScreenHeight))
        self.view.addSubview(gameView)
        controller.gameView = gameView
      } 
    }
