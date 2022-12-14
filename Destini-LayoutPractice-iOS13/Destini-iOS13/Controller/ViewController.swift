//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLable: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let tag = sender.tag
        storyBrain.updateStoryNumber(tag)
        updateUI()
    }
    
    func updateUI(){
        storyLable.text = storyBrain.getStory()
        choiceOneButton.setTitle(storyBrain.getChoice1(), for: .normal)
        choiceTwoButton.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}

