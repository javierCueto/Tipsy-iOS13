//
//  ResultViewController.swift
//  Tipsy
//
//  Created by José Javier Cueto Mejía on 03/11/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var textInfo: UILabel!
    
    var total : Float  = 0.0
    var people : Int = 0
    var tip : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerPerson.text = String(format: "%0.2f", total)
        textInfo.text = "Total entre \(people), con propina del \(tip)%."
    }
    
    
   
    
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
}
