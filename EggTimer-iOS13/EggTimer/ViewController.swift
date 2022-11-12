//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let boilTimes : [String : Float] = ["Soft": 24.0, "Medium": 420.0, "Hard": 660.0]
    var counter : Float = 0.0
    var totalTime : Float = 0.0
    var timer = Timer()
    @IBOutlet weak var topMessege: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player = AVAudioPlayer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        topMessege.text = sender.currentTitle!
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = boilTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter < totalTime {
//            print("\(counter) seconds")
            progressBar.progress = counter / totalTime
            counter += 1
        }
        else{
            timer.invalidate()
            topMessege.text = "Done!"
            progressBar.progress = 1.0
            playSound()
            counter = 0
        }
    }
    
    func playSound(){
        let fileType = "mp3"
        let fileName = "alarm_sound"
        let url = Bundle.main.url(forResource: fileName, withExtension: fileType)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
