//
//  Leaderboards.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 12/08/22.
//

import UIKit

struct players: Decodable{
    var name: String
    var score: Int
}

//declare array

class myCell: UITableViewCell{
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
    
    public func getData(forName name: String) -> Data?{
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                    let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    return jsonData
                }
            } catch {
                print(error)
            }
        return nil
    }
    
    public func getJSON(jsonData: Data){
        let decoder = JSONDecoder()
        let player = try! decoder.decode(players.self, from: jsonData)

        print(player.name)
    }
    

    /**
        Loads the View Controller
     */
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let localData = self.getData(forName: "leaderboard") {
            self.getJSON(jsonData: localData)
        }
        //add data source
    }
    
    /**
        When the maori button is clicked it stores that and displays it on the screen
        - Parameters:
            - any: [in] allows method to be sent anything
    */
}
