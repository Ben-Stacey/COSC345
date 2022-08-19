//
//  QuizTitleViewController.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 19/08/22.
//

import UIKit

class QuizTitleViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!{
        didSet{
            playButton.layer.cornerRadius = playButton.frame.height/4
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickPlay(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
