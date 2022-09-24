//
//  SettingsViewController.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 22/09/22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var langPicked: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func maoriButton(_ sender: Any) {
        MainMenu.setLanguageNum(l: 3)
        MainMenu.setLanguage(lang: "maori")
        langPicked.text = MainMenu.getLanguage()
    }
    @IBAction func spanishButton(_ sender: Any) {
        MainMenu.setLanguageNum(l: 2)
        MainMenu.setLanguage(lang: "spanish")
        langPicked.text = MainMenu.getLanguage()
    }
    @IBAction func frenchButton(_ sender: Any) {
        MainMenu.setLanguageNum(l: 1)
        MainMenu.setLanguage(lang: "french")
        langPicked.text = MainMenu.getLanguage()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        if nameField.text != ""{
            MainMenu.setName(nam: nameField.text ?? MainMenu.getName())
        }
        
        
        guard let view = storyboard?.instantiateViewController(withIdentifier:"HomeScreen") as? HomeScreen else{return}
        self.navigationController?.pushViewController(view, animated:true)
    }

}
