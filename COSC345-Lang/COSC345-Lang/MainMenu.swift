 //
//  ViewController.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 10/08/22.
//

import UIKit
import Foundation

class MainMenu: UIViewController {
    
    var language = ""
    var name = ""
    
    var langSelected: Bool = false
    var nameSelected: Bool = false
    
    /**
        Declarations for UI elements
        - Parameters:
            - label: outlet for the label
            - textfield: outlet for the textfield
            - start: outlet set for the start button
    */
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var start: UIButton!
    
    /**
        When the maori button is clicked it stores that and displays it on the screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
    @IBAction public func maoriButtion(_ sender: Any) {
        language = "maori"
        label.text = (language)
        langSelected = true
    }
    
    /**
        When the french button is clicked it stores that and displays it on the screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
    @IBAction public func frenchButton(_ sender: Any) {
        language = "french"
        label.text = (language)
        langSelected = true
    }
    
    /**
        When the spanish button is clicked it stores that and displays it on the screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
    @IBAction public func spanishButton(_ sender: Any) {
        language = "spanish"
        label.text = (language)
        langSelected = true
    }
    
    /**
        When the start button is clicked the text that is entered into the textfield it stores that as the name.
        This also checks that the paramters are filled before entering the next screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
    @IBAction public func start(_ sender: Any) {
        if let n = textfield.text{
            name = n
            nameSelected = true
        }
        
        if nameSelected == true && langSelected == true{
            guard let vc = storyboard?
                .instantiateViewController(withIdentifier:
                                            "HomeScreen") as? HomeScreen else{return}
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let alert = UIAlertController(title: "not selected", message: "Name or Language not selected", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
