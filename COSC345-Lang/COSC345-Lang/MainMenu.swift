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
    }
    
    /**
        When the french button is clicked it stores that and displays it on the screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
    @IBAction public func frenchButton(_ sender: Any) {
        language = "french"
        label.text = (language)
    }
    
    /**
        When the spanish button is clicked it stores that and displays it on the screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
    /**
        Example of SwiftDoc stuff in SWIFT.
        - Parameters:
            - value: [in] The number to return.
        - Returns: The parameter passed to it.
    */
    @IBAction public func spanishButton(_ sender: Any) {
        language = "spanish"
        label.text = (language)
    }
    
    /**
        When the start button is clicked the text that is entered into the textfield it stores that as the name
        - Parameters:
            - any: [in] allows method to be sent anything
    */
    @IBAction public func start(_ sender: Any) {
        if let n = textfield.text{
            name = n
        }
    }
    
    /**
        When the start button is clicked it checks that the name and language are not null and then allows the segue to happen
        - Parameters:
            - NSCoder: [in]declares the interface used by concrete subclasses to transfer objects and other values between memory
        - Returns:
            - HomeScreen: If the the parameters arent empty then the home screen object is called
            - nil: if the parameters are empty then do not let the segue happen
    */
    /**
    @IBSegueAction public func startReady(_ coder: NSCoder) -> HomeScreen? {
        if !language.isEmpty, !name.isEmpty{
            return HomeScreen(coder: coder, language: language, name: name)
        }else{
            return nil
        }
    }
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
