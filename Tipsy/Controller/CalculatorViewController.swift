//
//  ViewController.swift
//  Tipsy
//
//  Created by khalil panahi.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!

    var billBrain : BillBrain = BillBrain()
    
    override func viewDidLoad() {
        billBrain.updateSplitValue(value: 2)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case 1:
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case 2:
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        default:
            print("error in updating button background")
        }

    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billBrain.updateSplitValue(value: Int(sender.value))
        splitNumberLabel.text = String(billBrain.getSplitValue())
    }

    @IBAction func calculatePressed(_: UIButton) {
        billBrain.updateTipAmount(selesctedButton: getSelectedTipButton())
        if let text = billTextField.text {
            billBrain.calculateTheBill(receivedValue: text)
        }
        
        self.performSegue(withIdentifier: "goToResultViewController", sender: self)
    }

    func getSelectedTipButton() -> String {
        if zeroPctButton.isSelected {
            return "zeroPct"
        } else if tenPctButton.isSelected {
            return "tenPct"
        } else {
            return "twentyPct"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultViewController" {
                    let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedResult = billBrain.getBillValue()
            destinationVC.numberOfPeople = billBrain.getSplitValue()
            destinationVC.tipPercentage = billBrain.getTipAmount()
        }
    }
    
}
