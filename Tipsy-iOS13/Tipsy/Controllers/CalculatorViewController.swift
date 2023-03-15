import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billBrain:BillBrain?
    
    var tip = 10
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        switch(sender.currentTitle!){
        case"0%":
            zeroPctButton.isSelected = true
            tip = 0
            break
        case"10%":
            tenPctButton.isSelected = true
            tip = 10
            break
        case"20%":
            twentyPctButton.isSelected = true
            tip = 20
            break
        default:
            print("Nil")
            break
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text ?? "0") ?? 0.0
        let numberOfPersons = Int(splitNumberLabel.text ?? "1") ?? 1
        billBrain = BillBrain(bill: bill, tip: tip, numberOfPersons: numberOfPersons)
//        print(billBrain?.calculateBillPerPerson() ?? 0.0)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.totalBill = billBrain?.calculateBillPerPerson() ?? 0.0
            resultsViewController.tip = billBrain?.getTip()
            resultsViewController.numberOfPersons = billBrain?.getNumberOfPersons()
        }
    }
}

