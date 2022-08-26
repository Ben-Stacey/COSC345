//
//  HomeScreen.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 26/08/22.
//

import UIKit

class HomeScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
