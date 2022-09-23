//
//  CheatSheet.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 15/08/22.
//

import UIKit

struct Root: word{
    var word: translations
}

struct translations: Decodable{
    var english:String
    var moari: String
    var french: String
    var spanish: String
}

class myCellCheatSheet: UITableViewCell{
    
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var moariLabel: UILabel!
    @IBOutlet weak var frenchLabel: UILabel!
    @IBOutlet weak var spanishLabel: UILabel!
    
}

/**
    View Controller for the Cheat Sheet
 */
public class CheatSheet: UIViewController {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let english = word[indexPath.row]
        let maori = word[indexPath.row]
        let french = word[indexPath.row]
        let spanish = word[indexPath.row]
        
        cell.englishLabel?.text = english
        cell.moariLabel?.text = moari
        cell.frenchLabel?.text = french
        cell.spanishLabel?.text = spanish
        
        return cell
    }
    
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
        let word = try! decoder.decode(word.self, from: jsonData)

        print(word.translations)
    }
    
    /**
        Loads the View Controller
     */
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let localData = self.getData(forName: "word") {
            self.getJSON(jsonData: localData)
        }

        // Do any additional setup after loading the view.
    }
}
