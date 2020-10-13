//
//  ViewController.swift
//  PickerView
//
//  Created by Rodrigo Leme on 09/10/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        //print(myDatePicker.date)
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = DateFormatter.Style.short
        dateFormater.timeStyle = DateFormatter.Style.short
        
        dateFormater.dateFormat = "dd/MM/yyyy"
        
        let strDate = dateFormater.string(from: sender.date)
        
        print(strDate)
    }
    
}

