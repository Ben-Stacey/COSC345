//
//  Leaderboards.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 12/08/22.
//

import UIKit

struct players{
    var name: String
    var score: Int
}

//declare array

class myCell{
    //outlets
}
 

/**
    View Controller for the Leaderboards
 */
public class Leaderboards: UIViewController{
    
    //size of rows
    
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
        
        //return cell
    }
    

    /**
        Loads the View Controller
     */
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //if statement
        //add
    }
    
    /**
        When the maori button is clicked it stores that and displays it on the screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
}
