//
//  Leaderboards.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 12/08/22.
//

import UIKit
/**
class myCell{
    
}
 */

/**
    View Controller for the Leaderboards
 */
public class Leaderboards: UIViewController, UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    /**
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        return UITableView()
    }
     */
    
    public func getData(){
        
    }
    
    public func getJSON(){
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

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
}
