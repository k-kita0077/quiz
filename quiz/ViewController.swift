//
//  ViewController.swift
//  quiz
//
//  Created by kita kensuke on 2020/05/30.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedStartButton(_ sender: Any) {
        let vc = FirstQuestionViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

