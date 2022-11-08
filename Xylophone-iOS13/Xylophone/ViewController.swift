//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let title = sender.currentTitle
        playSound(btn: title!)
        
        /*UIView.animate is not being used
         because it disables the specific view for the duration.
         before IOS5 it used to disable the whole device for the duration*/
        
//        UIView.animate(withDuration: 0.2) {
//                sender.alpha = 0.5
//            }
        sender.alpha = 0.5

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
//            UIView.animate(withDuration: 0.2) {
//                sender.alpha = 1.0
//            }
            sender.alpha = 1.0
        }
    }
    
    func playSound(btn: String) {
        let fileType = "wav"
        let url = Bundle.main.url(forResource: btn, withExtension: fileType)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}

