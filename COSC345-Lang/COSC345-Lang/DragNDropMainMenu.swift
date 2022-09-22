//
//  DragNDrop MainMenu.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 22/09/22.
//

import UIKit

class DragNDropMainMenu: UIViewController {

    @IBOutlet weak var startButton: UIButton!{
        didSet{
            startButton.layer.cornerRadius = startButton.frame.height/2
        }
    }
    
    @IBOutlet weak var exitButton: UIButton!{
        didSet{
            exitButton.layer.cornerRadius = exitButton.frame.height/2
        }
    }
    
    @IBAction func onClickStart(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier:"DragNDrop") as? DragNDrop else{return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
