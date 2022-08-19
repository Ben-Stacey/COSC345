//
//  Minigames.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 12/08/22.
//
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
        let level1 = Level(levelNumber: 1)
        print("anagrams: \(level1.anagrams)")
    }
}
