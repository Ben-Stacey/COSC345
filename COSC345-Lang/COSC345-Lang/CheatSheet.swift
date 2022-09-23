//
//  CheatSheet.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 15/08/22.
//

import UIKit

class myCellCheatSheet: UIViewController{
    
}

/**
    View Controller for the Cheat Sheet
 */
public class CheatSheet: UIViewController, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    /**
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        return UITableView()
    }*/
    
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
    
}
