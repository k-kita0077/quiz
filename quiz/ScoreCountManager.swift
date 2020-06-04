//
//  ScoreCountManager.swift
//  quiz
//
//  Created by kita kensuke on 2020/05/30.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import Foundation

protocol ScoreDelegate:class {
    func getPoint() -> Int
}

class ScoreCountManager{
    static let sharedIntance = ScoreCountManager()
    
    var totalScore:Int = 0
    
    let score:Int = 10
    
    weak var delegate:ScoreDelegate?
    
    private init(){
        
    }
    
    func addScore(double: Int) {
        if let point = self.delegate?.getPoint(){
            self.totalScore += point * double
        }
    }
}
