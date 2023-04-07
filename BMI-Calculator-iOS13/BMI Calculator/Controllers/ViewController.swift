import UIKit

class ViewController: UIViewController {
    
    var calculatorBrainObj = CalculatorBrain()

    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var weightLable: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderUsed(_ sender: UISlider) {
        let currentValue = sender.value
        if sender.tag == 1{
//            currentValue = round(currentValue*100)/100
            heightLable.text = String(format: "%.2f", currentValue)+"m"
        }
        else if sender.tag == 2{
//            currentValue = round(currentValue*1)/1
            weightLable.text = String(format: "%.0f", currentValue)+"Kg"
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrainObj.calculateBmi(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.bmiValue = calculatorBrainObj.getBmiValue()
            destinationVC.advice = calculatorBrainObj.getAdvice()
            destinationVC.bacgroundColor = calculatorBrainObj.getBacGroundColor()
        }
    }
    
}

