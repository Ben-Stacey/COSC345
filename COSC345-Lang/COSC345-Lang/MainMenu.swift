//
//  ViewController.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 10/08/22.
//

import UIKit

class MainMenu: UIViewController {
    
    var language = ""
    var name = ""
    var checkOne = false
    var checkTwo = false
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var start: UIButton!
    
    @IBAction func maoriButtion(_ sender: Any) {
        language = "maori"
        label.text = (language)
        checkTwo = true
    }
    
    @IBAction func frenchButton(_ sender: Any) {
        language = "french"
        label.text = (language)
        checkTwo = true
    }
    
    @IBAction func spanishButton(_ sender: Any) {
        language = "spanish"
        label.text = (language)
        checkTwo = true
    }
    
    @IBAction func start(_ sender: Any) {
        if let n = textfield.text{
            name = n
        }
    }
    
    @IBSegueAction func startReady(_ coder: NSCoder) -> HomeScreen? {
        if !language.isEmpty, !name.isEmpty{
            return HomeScreen(coder: coder)
        }else{
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
