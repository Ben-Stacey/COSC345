//
//  SeaOfWordsHomeScreen.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 26/08/22.
//

import UIKit
import SwiftUI

//Home Screen for Sea of Words
class SeaofWordsHomeScreen: UIViewController {
    weak var playbutton: UIButton! {
        didSet {
            playButton.layer.cornerRadius = playButton.frame.height/2
        }
    }

    weak var topicButton: UIButton! {
        didSet {
            topicButton.layer.cornerRadius = topicButton.frame.height/2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func onClickPlay(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SeaofWordsView") as? SeaofWordsView else {
            return
            }
            self.navigationController?.pushViewController(vc, animated: true)
    }

    func onClickTopic(_ sender: Any){
        
    }
}
