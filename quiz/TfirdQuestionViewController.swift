//
//  TfirdQuestionViewController.swift
//  quiz
//
//  Created by kita kensuke on 2020/05/30.
//  Copyright © 2020 kita kensuke. All rights reserved.
//ケバブ

import UIKit
import AVFoundation

class TfirdQuestionViewController: UIViewController,ScoreDelegate {
    func getPoint() -> Int {
        return 15
    }
    
    @IBOutlet weak var timeLimitLabel: UILabel!
    
    @IBOutlet weak var getPointLabel: UILabel!
    
    
    @IBOutlet weak var thirdResultImageView: UIImageView!
    
    @IBOutlet weak var answerTextFiled: UITextField!
    
    var timer: Timer!
    var startTime = Date()
    var sec: Int = 0
    var timeLimit: Int = 10
    var residue: Int = 10
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreCountManager.sharedIntance.delegate = self
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.timerCounter),
                userInfo: nil,
                repeats: true)
            
            self.startTime = Date()
        }
    }

    @IBAction func tappedAnswerButton(_ sender: Any) {
        if self.answerTextFiled.text == "ケバブ" {
            timer.invalidate()
            ScoreCountManager.sharedIntance.addScore(double: residue)
            self.showTrue()
        } else {
            self.showFalse()
        }
    }
    
    func showTrue(){
        playSound(name: "truesound")
        self.thirdResultImageView.image = UIImage(named: "circle")
        self.getPointLabel.text = "\(residue * 15)点獲得"
        self.moveToSecondQuestion()
    }
    
    func showFalse(){
        timer.invalidate()
        playSound(name: "falsesound")
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
    
    @objc func timerCounter() {
        
        let currentTime = Date().timeIntervalSince(startTime)
        
        sec = (Int)(fmod(currentTime, 60))
        residue = timeLimit - sec
        
        timeLimitLabel.text = String(residue)

        if residue == 0 {
            timer.invalidate()
            playSound(name: "falsesound")
            self.thirdResultImageView.image = UIImage(named: "x")
            self.moveToSecondQuestion()
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

extension TfirdQuestionViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }

        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self

            // 音声の再生
            audioPlayer.play()
        } catch {
        }
    }
}
