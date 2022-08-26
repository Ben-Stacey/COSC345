//
//  QuizViewController.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 24/08/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = QuestionViewModel()
    var questions:[Question] = []
    
    var answerSelected = false
    var isCorrectAnswer = false
    
    var points = 0
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var z = 0
        while z < 10{
            if let root = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Phrases", ofType: "plist")!) as? [String: [String]] {
                
                let languageNum = MainMenu.getLanguageNum()//1 for french, 2 for spanish, 3 for maori. //Int.random(in: 1...3)
                print(languageNum)
                var language: String = ""
                if languageNum == 1{
                    language = "French"
                }else if(languageNum == 2){
                    language = "Spanish"
                }else if(languageNum == 3){
                    language = "Maori"
                }
                var randAnswersFromLanguage:[String] = []
                
                for (_, phraseArray) in root {
                    print(phraseArray[languageNum])
                    randAnswersFromLanguage.append(phraseArray[languageNum])
                }
                
                var randAnswersLength = randAnswersFromLanguage.count - 1
                let randomNumber = Int.random(in: 0...randAnswersLength)
                randAnswersFromLanguage.remove(at: randomNumber)
                randAnswersLength -= 1
                
                var i = 0
                for (_, phraseArray) in root {
                    if i == randomNumber {
                        let options = [phraseArray[languageNum], randAnswersFromLanguage[Int.random(in: 0...randAnswersLength)], randAnswersFromLanguage[Int.random(in: 0...randAnswersLength)], randAnswersFromLanguage[Int.random(in: 0...randAnswersLength)]]
                        let shuffledOptions = options.shuffled()

                        
                        
                        let correct_answer = phraseArray[languageNum]
                        let option_1 = shuffledOptions[0]
                        let option_2 = shuffledOptions[1]
                        let option_3 = shuffledOptions[2]
                        let option_4 = shuffledOptions[3]
                        let question = "Translate \"\(phraseArray[0])\" to \(language)"
                        
                        questions.append(Question(correct_answer: correct_answer, option_1: option_1, option_2: option_2, option_3: option_3, option_4: option_4, question: question))
                    }
                    
                    i += 1
                }
            }
            z += 1
        }
        
        viewModel.apiToGetQuestionData {
            [weak self] in self?.questions = self!.questions
            DispatchQueue.main.async{
                self?.collectionView.delegate = self
                self?.collectionView.dataSource = self
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func onClickExit(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        if !answerSelected{
            let alert = UIAlertController(title: "Select an Option", message: "You must select an option before moving on to the next question.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return
        }
        answerSelected = false
        
        if isCorrectAnswer{
            points += 1
        }
        
        if index < (self.questions.count) - 1{
            index += 1
            collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
        }else{
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuizResultViewController") as? QuizResultViewController else{return}
            vc.result = points
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionViewCell", for: indexPath) as? QuizCollectionViewCell else{
            return QuizCollectionViewCell()
        }
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5
        cell.setValues = questions[indexPath.row]
        cell.selectedOption = {[weak self] isCorrect in
            self?.answerSelected = true
            self?.isCorrectAnswer = isCorrect
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
