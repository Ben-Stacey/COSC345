//
//  DragNDrop.swift
//  COSC345-Lang
//
//  Created by Ben Stacey on 22/09/22.
//

import UIKit

class DragNDrop: UIViewController {
    
    //var viewModel = TileViewModel()
    var questions:[Question] = []
    
    var isCorrectAnswer = false
    
    var points = 0
    var index = 0

    @IBOutlet weak var tile1: UIView!
    @IBOutlet weak var tile2: UIView!
    @IBOutlet weak var tile3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tile1.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlerOne)))
        
        self.tile2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlerTwo)))
        
        self.tile3.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlerThree)))
    }
    
    @objc func handlerOne(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: self.view)
        let tile1 = gesture.view
        tile1?.center = location
                
        if gesture.state == .ended {
            if self.tile1.frame.midX >= self.view.layer.frame.width / 2 {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                            self.tile1.center.x = self.view.layer.frame.width - 40
                        }, completion: nil)
            }else{
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.tile1.center.x = 40
                }, completion: nil)
            }
        }
    }
    
    @objc func handlerTwo(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: self.view)
        let tile1 = gesture.view
        tile1?.center = location
                
        if gesture.state == .ended {
            if self.tile2.frame.midX >= self.view.layer.frame.width / 2 {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                            self.tile2.center.x = self.view.layer.frame.width - 40
                        }, completion: nil)
            }else{
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.tile2.center.x = 40
                }, completion: nil)
            }
        }
    }
    
    @objc func handlerThree(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: self.view)
        let tile1 = gesture.view
        tile1?.center = location
                
        if gesture.state == .ended {
            if self.tile3.frame.midX >= self.view.layer.frame.width / 2 {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                            self.tile3.center.x = self.view.layer.frame.width - 40
                        }, completion: nil)
            }else{
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.tile3.center.x = 40
                }, completion: nil)
            }
        }
    }
}
