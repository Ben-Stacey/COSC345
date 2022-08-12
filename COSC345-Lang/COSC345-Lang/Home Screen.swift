//
//  Home Screen.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 10/08/22.
//

import UIKit

class HomeScreen: UIViewController {
    
    var language = ""
    var name = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var languageLabel: UITextField!

    @IBAction func maoriButton(_ sender: Any) {
        language = ""
        language = "maori"
        languageLabel.text = "Set to Moari"
    }
    
    @IBAction func frenchButton(_ sender: Any) {
        language = ""
        language = "french"
        languageLabel.text = "Set to French"
    }
    
    @IBAction func spanishButton(_ sender: Any) {
        language = ""
        language = "spanish"
        languageLabel.text = "Set to Spanish"
    }
    
    @IBAction func nameTextField(_ sender: Any) {
        //name = nameTextField.text
        if let x = nameTextField.text {
            name = x
            hello = "hello"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
