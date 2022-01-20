//
//  ViewController.swift
//  TipCalculator
//
//  Created by William Krasnov on 1/20/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitSwitch: UISwitch!
    @IBOutlet weak var splitTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func textChanged(_ sender: UITextField) {
        calculateTip(billAmountTextField!)
    }

    @IBAction func onSplitEnable(_ sender: UISwitch) {
        if splitTextField.isEnabled {
            splitTextField.isEnabled = false
            splitLabel.text = "$0.00"
        }
        else {
            splitTextField.isEnabled = true
        }
    }
    @IBAction func addSplit(_ sender: UITextField) {
        let tip = calcTip()
        let split = Float(splitTextField.text!) ?? 1.0
        let splitTip = tip / split
        splitLabel.text = String(format: "$%.2f", splitTip)
    }

    @IBAction func calculateTip(_ sender: Any) {
        calcTip()
    }
    func calcTip()->Float{
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        return Float(tip)
    }
}

