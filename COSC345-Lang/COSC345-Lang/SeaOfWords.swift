//
//  SoWViewController.swift
//  COSC345-Lang
//
//  Created by Mahfuz Abdul Razak on 22/09/22.
//
/*
 The View Controller for Sea of Words
 */
import UIKit

let lang = MainMenu.getLanguageNum()
let allQuestions = SoWQuestionBank()
var questionNumber: Int = 0
var score: Int = 0
var selectedAnswer: Int = 0
var quest = [SoWQuestions]()

public class SeaofWords: UIViewController {
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionWord: UILabel!
    
    //Outlet for Buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
   
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func quit(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        /*
         if sender.tag == 1 {
         print("option a")
         }else if sender.tag == 2{
         print("option b")
         }else if sender.tag == 3{
         print("option c")
         }else {
         print("option d")
         }
         */
        if sender.tag == selectedAnswer {
            print("correct")
            score += 1
        } else {
            print("wrong")
        }
        questionNumber += 1
        updateQuestion()
    }
    func updateQuestion(){
        if lang == 2 {
             quest = allQuestions.list.shuffled()
            if questionNumber <= quest.count - 1{
                questionLabel.text = quest[questionNumber].question
                questionWord.text = quest[questionNumber].questionWord
                optionA.setTitle(quest[questionNumber].optionA, for: UIControl.State.normal)
                optionB.setTitle(quest[questionNumber].optionB, for: UIControl.State.normal)
                optionC.setTitle(quest[questionNumber].optionC, for: UIControl.State.normal)
                optionD.setTitle(quest[questionNumber].optionD, for: UIControl.State.normal)
                selectedAnswer = quest[questionNumber].correctAnswer
                
            }else {
                let alert = UIAlertController(title:"Awesome! You got \(score)/\(allQuestions.list.count)", message:"End of Quiz. Do you want to start over?", preferredStyle:.alert)
                let restartAction = UIAlertAction(title:"Restart", style:.default, handler: {
                    action in self.restartQuiz()
                    
                })
                let goBackAction = UIAlertAction(title:"Back to Main Menu", style:.default, handler:{ action in self.dismiss(animated:true, completion:nil)})
                alert.addAction(restartAction)
                alert.addAction(goBackAction)
                present(alert, animated: true, completion: nil)
            }
            HomeScreen.increaseXp(amount: score)
            updateUI()
        } else if lang == 1 {
            quest = allQuestions.french.shuffled()
           if questionNumber <= quest.count - 1{
               questionLabel.text = quest[questionNumber].question
               questionWord.text = quest[questionNumber].questionWord
               optionA.setTitle(quest[questionNumber].optionA, for: UIControl.State.normal)
               optionB.setTitle(quest[questionNumber].optionB, for: UIControl.State.normal)
               optionC.setTitle(quest[questionNumber].optionC, for: UIControl.State.normal)
               optionD.setTitle(quest[questionNumber].optionD, for: UIControl.State.normal)
               selectedAnswer = quest[questionNumber].correctAnswer
            }else {
                let alert = UIAlertController(title:"Awsome !, you got \(score)/\(allQuestions.french.count)", message:"End of Quiz. Do you want to start over ?", preferredStyle:.alert)
                let restartAction = UIAlertAction(title:"Restart", style:.default, handler: {
                    action in self.restartQuiz()
                    
                })
                let goBackAction = UIAlertAction(title:"Back to Main Menu", style:.default, handler:{ action in self.dismiss(animated:true, completion:nil)})
                alert.addAction(restartAction)
                alert.addAction(goBackAction)
                present(alert, animated: true, completion: nil)
            }
            HomeScreen.increaseXp(amount: score)
            updateUI()
        } else if lang == 3 {
            quest = allQuestions.maori.shuffled()
           if questionNumber <= quest.count - 1{
               questionLabel.text = quest[questionNumber].question
               questionWord.text = quest[questionNumber].questionWord
               optionA.setTitle(quest[questionNumber].optionA, for: UIControl.State.normal)
               optionB.setTitle(quest[questionNumber].optionB, for: UIControl.State.normal)
               optionC.setTitle(quest[questionNumber].optionC, for: UIControl.State.normal)
               optionD.setTitle(quest[questionNumber].optionD, for: UIControl.State.normal)
               selectedAnswer = quest[questionNumber].correctAnswer
                
            }else {
                let alert = UIAlertController(title:"Awsome !, you got \(score)/\(allQuestions.maori.count)", message:"End of Quiz. Do you want to start over ?", preferredStyle:.alert)
                let restartAction = UIAlertAction(title:"Restart", style:.default, handler: {
                    action in self.restartQuiz()
                    
                })
                let goBackAction = UIAlertAction(title:"Back to Main Menu", style:.default, handler:{ action in self.dismiss(animated:true, completion:nil)})
                alert.addAction(restartAction)
                alert.addAction(goBackAction)
                present(alert, animated: true, completion: nil)
            }
            HomeScreen.increaseXp(amount: score)
            updateUI()
        }
    }
    
    func updateUI() {
        if lang == 2 {
            scoreCounter.text = "Score: \(score)"
            if questionNumber <= allQuestions.list.count - 1{
                questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
            }
            progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        } else if lang == 1 {
            scoreCounter.text = "Score: \(score)"
            if questionNumber <= allQuestions.french.count - 1{
                questionCounter.text = "\(questionNumber + 1)/\(allQuestions.french.count)"
            }
            progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.french.count)) * CGFloat(questionNumber + 1)
        } else if lang == 3 {
            scoreCounter.text = "Score: \(score)"
            if questionNumber <= allQuestions.maori.count - 1{
                questionCounter.text = "\(questionNumber + 1)/\(allQuestions.maori.count)"
            }
            progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.maori.count)) * CGFloat(questionNumber + 1)
        }
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
    }
    
    public class func setQuestionNumber(qNum:Int) {
        questionNumber = qNum
    }
    
    public class func getQuestionNumber() -> Int {
        return questionNumber
    }
    
    public class func setScore(sc:Int) {
        score = sc
    }
    
    public class func getScore() -> Int {
        return score
    }
    
}
