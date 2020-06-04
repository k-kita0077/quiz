//
//  FirstQuestionViewController.swift
//  quiz
//
//  Created by kita kensuke on 2020/05/30.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class FirstQuestionViewController: UIViewController,ScoreDelegate {
    func getPoint() -> Int {
        return 5
    }
    
    @IBOutlet weak var firstResultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreCountManager.sharedIntance.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedFirstChoiceButton(_ sender: Any) {
        ScoreCountManager.sharedIntance.addScore()
        self.showTrue()
        
    }
    
    @IBAction func tappedSecondChoiceButton(_ sender: Any) {
        self.showFalse()
    }
    
    @IBAction func tappedThirdChoiceButton(_ sender: Any) {
        self.showFalse()
    }
    
    func showTrue(){
        self.firstResultImageView.image = UIImage(named: "circle")
        self.moveToSecondQuestion()
    }
    
    func showFalse(){
        self.firstResultImageView.image = UIImage(named: "x")
        self.moveToSecondQuestion()
    }
    
    
    func moveToSecondQuestion(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let vc = SecondQuestionViewController()
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
