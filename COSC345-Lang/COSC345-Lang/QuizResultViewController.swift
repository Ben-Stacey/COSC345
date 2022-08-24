//
//  QuizResultViewController.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 24/08/22.
//

import UIKit

class QuizResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultLabel.text = "\(result)"
    }
    

    @IBAction func onClickHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
