//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        titleLabel.text = "How did you like your eggs?"
        progressBar.progress = 0
    }
    
    var eggDictionary: [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer: Timer?
    var isCountingDown = false
    var secondsPassed = 0
    var totalTime = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        // Check if a timer is already running
        if isCountingDown {
            // If a timer is running, invalidate it to stop the countdown
            timer?.invalidate()
        }
        totalTime = eggDictionary[hardness]!
        progressBar.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
        // Start a new countdown
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isCountingDown = true
        
    }
    
    @objc func updateTimer() {
        if secondsPassed <= totalTime {
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
        } else {
            timer?.invalidate()
            isCountingDown = false
            titleLabel.text = "Done"        }
    }

    
}


