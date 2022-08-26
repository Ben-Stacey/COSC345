//
//  HomeScreen.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 26/08/22.
//

import UIKit

/**
    View Controller for the Home Screen
 */
public class HomeScreen: UIViewController {
    
    /**
        Loads the View Controller
     */
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     Removes the back button from the top of the view controller
     - Parameters:
      - animates: [in] gives the bool for the animation on the view controller
     */
    public override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
