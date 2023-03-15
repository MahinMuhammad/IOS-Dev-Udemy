//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Md. Mahinur Rahman on 3/14/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var totalBill:Float?
    var numberOfPersons:Int?
    var tip:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.1 f", totalBill ?? 0.00)
        settingsLabel.text = "Split between \(numberOfPersons ?? 1) people, with \(tip ?? 0)% tip."
    }
    


    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
