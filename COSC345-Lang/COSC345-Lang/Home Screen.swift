//
//  Home Screen.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 10/08/22.
//

import UIKit
import Foundation

class HomeScreen: UIViewController {
    
    var language: String
    var name: String
    
    init(name: String, language: String){
        self.language = language
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

