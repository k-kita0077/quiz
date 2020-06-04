//
//  TimeController.swift
//  quiz
//
//  Created by kita kensuke on 2020/06/04.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import Foundation

class TimeController {
    var timer: Timer!
    var startTime = Date()
    var sec: Int = 0
    var timeLimit: Int = 10
    var residue: Int = 10
    
    func timerStart() {
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
    @objc func timerCounter() {
        
        let currentTime = Date().timeIntervalSince(startTime)
        
        sec = (Int)(fmod(currentTime, 60))
        residue = timeLimit - sec
        
        timeLimitLabel.text = String(residue)

        if residue == 0 {
            timer.invalidate()
            self.firstResultImageView.image = UIImage(named: "x")
            self.moveToSecondQuestion()
        }
        
    }
    
}
