import UIKit
import SwiftUI

//Result Screen for Sea of Words

class SeaofWordsResult: UIViewController {

    weak var resultLabel: UILabel!

    var result = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(result)"
        // Do any additonal setup after loading
    }

    func onClickHome(_ sender: Any) {
        navigationController?.popToRootViewController(animate: true)
    }
}