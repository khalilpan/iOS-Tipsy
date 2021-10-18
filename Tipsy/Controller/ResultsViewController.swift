//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by khalil panahi on 16/10/21.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingslabel: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    var calculatedResult: Float?
    var numberOfPeople: Int?
    var tipPercentage: Float?
    var textTipPercentage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let percentage = tipPercentage {
        updateTextTipPercentage(value: percentage)
        }
        
        if let calcResult = calculatedResult {
            totalLabel.text = String(calcResult)
        }
        settingslabel.text = "Split between \(numberOfPeople ?? 0) people, with \(textTipPercentage ?? "")% tip."
      
    }

    @IBAction func recalculatePressed(_: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func updateTextTipPercentage(value: Float) {
        switch value {
        case 0.0:
            self.textTipPercentage = "0"
        case 0.1:
            self.textTipPercentage = "10"
        case 0.2:
            self.textTipPercentage = "20"
        default:
            self.textTipPercentage = "ERROR"
        }
    }
    
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
