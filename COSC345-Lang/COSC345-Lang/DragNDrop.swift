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

    @IBOutlet weak var draggableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.draggableView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handler)))
    }
    
    @objc func handler(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: self.view)
        let draggedView = gesture.view
        draggedView?.center = location
                
        if gesture.state == .ended {
            if self.draggableView.frame.midX >= self.view.layer.frame.width / 2 {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                            self.draggableView.center.x = self.view.layer.frame.width - 40
                        }, completion: nil)
            }else{
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    self.draggableView.center.x = 40
                }, completion: nil)
            }
        }
    }
}
