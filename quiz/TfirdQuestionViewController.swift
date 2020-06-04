//
//  TfirdQuestionViewController.swift
//  quiz
//
//  Created by kita kensuke on 2020/05/30.
//  Copyright © 2020 kita kensuke. All rights reserved.
//ケバブ

import UIKit

class TfirdQuestionViewController: UIViewController,ScoreDelegate {
    func getPoint() -> Int {
        return 15
    }
    
    @IBOutlet weak var thirdResultImageView: UIImageView!
    
    @IBOutlet weak var answerTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreCountManager.sharedIntance.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedAnswerButton(_ sender: Any) {
        if self.answerTextFiled.text == "ケバブ" {
            ScoreCountManager.sharedIntance.addScore()
            self.showTrue()
        } else {
            self.showFalse()
        }
    }
    
    func showTrue(){
        self.thirdResultImageView.image = UIImage(named: "circle")
        self.moveToSecondQuestion()
    }
    
    func showFalse(){
        self.thirdResultImageView.image = UIImage(named: "x")
        self.moveToSecondQuestion()
    }
    
    
    func moveToSecondQuestion(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let vc = ScoreViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: true,completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
