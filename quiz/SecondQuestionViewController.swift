//
//  SecondQuestionViewController.swift
//  quiz
//
//  Created by kita kensuke on 2020/05/30.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class SecondQuestionViewController: UIViewController,ScoreDelegate {
    func getPoint() -> Int {
        return 10
    }
    
    @IBOutlet weak var secondResultImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreCountManager.sharedIntance.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedFirstButton(_ sender: Any) {
        self.showFalse()
    }
    
    @IBAction func tappedSecondButton(_ sender: Any) {
        self.showFalse()
    }
    
    @IBAction func tappedThirdButton(_ sender: Any) {
        self.showFalse()
    }
    
    @IBAction func tappedFourthButton(_ sender: Any) {
        ScoreCountManager.sharedIntance.addScore()
        self.showTrue()
    }
    
    @IBAction func tappedFifthButton(_ sender: Any) {
        self.showFalse()
    }
    
    func showTrue(){
        self.secondResultImageView.image = UIImage(named: "circle")
        self.moveToSecondQuestion()
    }
    
    func showFalse(){
        self.secondResultImageView.image = UIImage(named: "x")
        self.moveToSecondQuestion()
    }
    
    
    func moveToSecondQuestion(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let vc = TfirdQuestionViewController()
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
