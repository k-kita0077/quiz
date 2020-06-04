//
//  ScoreViewController.swift
//  quiz
//
//  Created by kita kensuke on 2020/05/30.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showScore()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToStartView(_ sender: Any) {
        ScoreCountManager.sharedIntance.totalScore = 0
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func showScore(){
        self.resultLabel.text = "あなたの点数は\(ScoreCountManager.sharedIntance.totalScore)点です"
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
