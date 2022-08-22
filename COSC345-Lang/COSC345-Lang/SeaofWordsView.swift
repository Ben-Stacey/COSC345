import UIKit
import SwiftUI

//Quiz Screen for sea of words

class SeaofWordsView: UIViewController {
    weak var collectionView: UICollectionView!

    var viewModel = QuestionViewModel()
    var questions:[Questions]?

    var answerSelected = false
    var is CorrectAnser = false

    var points = 0
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading
        viewModel.apiToGetQuestionData {
            [weak self] in
            self?.questions = self?.viewModel.questionData?.data?.questions
            DispatchQueue.main.async {
                self?.collectionView.delegate = self
                self?.collectionView.dataSource = self
                self?.collectionView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func onClickExit(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    func onClickNext(_ sender: Any ) {

        if !answerSelected {
            let alert = UIAlertController(title: "Select The Word", message: "Please select one option before moving to the next question", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        answerSelected = false
        if isCorrectAnswer {
            points += 1
        }
        print(index)
        if index<(self.questions?.count ?? 0) - 1 {
            index += 1
            collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)


        } else {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
            vc.result = points
            self.naviagtionController?.pushViewController(vc, animated: true)
        }
    }
}

