//
//  SoWViewController.swift
//  COSC345-Lang
//
//  Created by Mahfuz Abdul Razak on 22/09/22.
//
/*
 commit
 
 
 */
import UIKit

public class SeaofWords: UIViewController {
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreCounter : UILabel!
    @IBOutlet weak var progressView : UIView!
    @IBOutlet weak var questionLabel : UILabel!
    @IBOutlet weak var questionWord : UILabel!
    
    //Outlet for Buttons
    @IBOutlet weak var optionA : UIButton!
    @IBOutlet weak var optionB : UIButton!
    @IBOutlet weak var optionC : UIButton!
    @IBOutlet weak var optionD : UIButton!
    
    let allQuestions = SoWQuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    
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
        }else{
            print("wrong")
        }
        questionNumber += 1
        updateQuestion()
    }
    func updateQuestion(){

        if questionNumber <= allQuestions.list.count - 1{
            questionLabel.text = allQuestions.list[questionNumber].question
            questionWord.text = allQuestions.list[questionNumber].questionWord
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
            
        }else {
            let alert = UIAlertController(title: "Awsome !, you got \(score)/\(allQuestions.list.count)", message: "End of Quiz. Do you want to start over ?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                action in self.restartQuiz()
                
            })
            let goBackAction = UIAlertAction(title: "Back to Main Menu", style: .default, handler : { action in self.dismiss(animated: true, completion: nil)})
            alert.addAction(restartAction)
            alert.addAction(goBackAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
    }
    
    func updateUI(){
        scoreCounter.text = "Score: \(score)"
        if questionNumber <= allQuestions.list.count - 1{
            questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        }
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
    }

}
