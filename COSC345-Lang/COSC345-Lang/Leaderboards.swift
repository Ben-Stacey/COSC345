//
//  Leaderboards.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 12/08/22.
//

import UIKit

/**
    View Controller for the Leaderboards
 */
public class Leaderboards: UIViewController {

    /**
        Loads the View Controller
     */
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /**
        When the maori button is clicked it stores that and displays it on the screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
    @IBOutlet public weak var LeaderboardTable: UITableView!
}
