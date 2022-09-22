//
//  DragNDropResult.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 22/09/22.
//

import UIKit

class DragNDropResult: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(result)"
    }
    
    @IBAction func homeButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
