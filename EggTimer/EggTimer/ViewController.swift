//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300,"Medium": 420,"Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
                
        timer.invalidate()
        let hardness = sender.currentTitle! //Soft , Medium , Hard
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self ,  selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
//            print(Float(secondsPassed)/Float(totalTime))

        } else {
            timer.invalidate()
            titleLable.text = "Done!"
//            progressBar.progress = 1
            progressBar.progressTintColor = UIColor.green
        }
    }
      
}
    

