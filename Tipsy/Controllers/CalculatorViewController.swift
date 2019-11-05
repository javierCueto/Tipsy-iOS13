//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var fieldTotal: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var stepperValues: UIStepper!
    var step : Float = 2.0
    var percent : Float = 0.1
    var total : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        let valueTip = sender.tag
        fieldTotal.endEditing(false)
        
        switch valueTip {
        case 0 :
            zeroButton.isSelected = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
        case 10 :
            zeroButton.isSelected = false
            tenButton.isSelected = true
            twentyButton.isSelected = false
        case 20 :
            zeroButton.isSelected = false
            tenButton.isSelected = false
            twentyButton.isSelected = true
        default:
            zeroButton.isSelected = false
            tenButton.isSelected = false
            twentyButton.isSelected = false
        }
        percent = Float (valueTip) / Float(100)

    }
    @IBAction func numberPersonStepper(_ sender: UIStepper) {
        fieldTotal.endEditing(false)
        step = Float(sender.value)
        personLabel.text = String(format: "%.0f",stepperValues.value)
        
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        if fieldTotal.text != "" {
            let t : Float? = Float(fieldTotal.text!)
            total = ((t! * percent) + t!) / step
            self.performSegue(withIdentifier: "goToResult", sender: self)
        } else {
            // create the alert
                  let alert = UIAlertController(title: "-.-", message: "Intento de hackeo fallido.", preferredStyle: UIAlertController.Style.alert)

                  // add an action (button)
                  alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                  // show the alert
                  self.present(alert, animated: true, completion: nil)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
                  let destinationVC = segue.destination as! ResultViewController
            destinationVC.people = Int(step)
            destinationVC.tip = Int(percent * 100)
            destinationVC.total = total
        }
    }
    
    
}

