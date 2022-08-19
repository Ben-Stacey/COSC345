//
//  Minigames.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 12/08/22.
//
import UIKit

class ViewController: UIViewController {
  
  private let controller:GameController
  
  required init(coder aDecoder: NSCoder) {
    controller = GameController()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let gameView = UIView(frame: CGRect(x:0, y: 0, width: ScreenWidth, height: ScreenHeight))
    self.view.addSubview(gameView)
    controller.gameView = gameView
    controller.onSentenceSolved = self.showLevelMenu
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.showLevelMenu()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
/**
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
 */
    // rebuild for towers
  func showLevelMenu() {
    let alertController = UIAlertController(title: "Choose your tower: ", message: nil,
    preferredStyle:UIAlertController.Style.alert)
    
    //2 set up the menu actions
      let easy = UIAlertAction(title: "Tower One", style:.default,
      handler: {(alert:UIAlertAction!) in
        self.showLevel(levelNumber: 1)
    })
      let hard = UIAlertAction(title: "Tower Two", style:.default,
      handler: {(alert:UIAlertAction!) in
        self.showLevel(levelNumber: 2)
    })
      let hardest = UIAlertAction(title: "Tower Three", style: .default,
      handler: {(alert:UIAlertAction!) in
        self.showLevel(levelNumber: 3)
    })
    
    //3 add the menu actions to the menu
    alertController.addAction(easy)
    alertController.addAction(hard)
    alertController.addAction(hardest)

    self.present(alertController, animated: true, completion: nil)
  }
  
  func showLevel(levelNumber:Int) {
    controller.level = Level(levelNumber: levelNumber)
    controller.dealRandomSentence()
  }
}

