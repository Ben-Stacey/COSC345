//
//  QuizTitleViewController.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 19/08/22.
//

import UIKit

class QuizTitleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var playButton: UIButton!{
        didSet {
            playButton.layer.cornerRadius = playButton.frame.height/2
        }
    }
    
    @IBOutlet weak var backButton: UIButton!{
        didSet {
            backButton.layer.cornerRadius = backButton.frame.height/2
        }
    }
    
    @IBAction func onClickPlay(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
