import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLable: UILabel!
    var bmiValue:Float?
    var advice:String?
    var bacgroundColor:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = String(format: "%.1 f", bmiValue ?? 0.00)
        adviceLable.text = advice
        view.backgroundColor = bacgroundColor
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
