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
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func nameTextField(_ sender: Any) {
        
    }
    
    @IBAction func maoriButton(_ sender: Any) {
        language = "maori"
        label.text = ("Maori")
    }
    
    @IBAction func frenchButton(_ sender: Any) {
        language = "french"
        label.text = ("French")
    }
    
    @IBAction func spanishButton(_ sender: Any) {
        language = "spanish"
        label.text = ("Spanish")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
