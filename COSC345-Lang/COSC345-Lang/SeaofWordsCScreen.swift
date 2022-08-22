import UIKit
import SwiftUI

// Quiz Collectioon Cell

class SeaofWordsCScreen: UICollectionViewCell {
    weak var questionlabel: UILabel!

    weak var option1: UILabel!
    weak var option2: UILabel!
    weak var option3: UILabel!
    weak var option4: UILabel!

    weak var optionA: UILabel!
    weak var optionB: UILabel!
    weak var optionC: UILabel!
    weak var optionD: UILabel!

    private var correctAnswer: String?

    var setValues: Questions? {
        didSet {
            questionLabel.text = setValues?.question
            option1.text = setValues?.option_1
            option2.text = setValues?.option_2
            option3.text = setValues?.option_3
            option4.text = setValues?.option_4

            correctAnswer = setValues?.correct_answer

        }
    }

    override func prepareForReuse() {
        updateBorder(myView: optionA)
        updateBorder(myView: optionB)
        updateBorder(myView: optionC)
        updateBorder(myView: optionD)
    }

    var selectedOption: ((_ selectedAnswer: Bool) -> Void)?

    func onClickOptionA(_ sender: Any) {
        var isCorrect = false

        if correctAnswer == setValues?.option_1 {
            isCorrect = true
        }
        selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionA)
    }

    func onClickOptionB(_ sender: Any) {
        var isCorrect = false

        if correctAnswer == setValues?.option_2 {
            isCorrect = true
        }
         selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionB)
    }

    func onClickOptionC(_ sender: Any) {
        var isCorrect = false

        if correctAnswer == setValues?.option_3 {
            isCorrect = true
        }
         selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionC)
    }

    func onClickOptionD(_ sender: Any) {
        var isCorrect = false

        if correctAnswer == setValues?.option_4 {
            isCorrect = true
        }
         selectedOption?(isCorrect)
        changeBorder(selectedOption: .optionD)
    }

    func changeBorder(selectedOption: SelectedOption) {
        switch selectedOption {
            case .optionA:
                updateBorder(myView: optionA, borderWidth: 4)
                updateBorder(myView: optionB)
                updateBorder(myView: optionC)
                updateBorder(myView: optionD)
            case .optionB:
                updateBorder(myView: optionB, borderWidth: 4)
                updateBorder(myView: optionA)
                updateBorder(myView: optionC)
                updateBorder(myView: optionD)
            case .optionC:
                updateBorder(myView: optionC, borderWidth: 4)
                updateBorder(myView: optionB)
                updateBorder(myView: optionA)
                updateBorder(myView: optionD)
            case .optionD:
                updateBorder(myView: optionD, borderWidth: 4)
                updateBorder(myView: optionB)
                updateBorder(myView: optionC)
                updateBorder(myView: optionA)
        }
    }

    func updateBorder(myView, borderWidth: CGFloat = 0) {
        myView.layer.borderWidth = borderWidth
        myView.layer.borderColor = UIColor.white.cgColor
    }


}