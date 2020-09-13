//
//  ViewController.swift
//  HelloOutlet
//
//  Created by Rodrigo Leme on 31/08/20.
//  Copyright © 2020 Rodrigo Leme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelHello.text = "Fala aí";
    }
    
    
    @IBAction func Action(_ sender: Any) {
        labelHello.text = "Yeye: \(Int.random(in: 0...3))"
    }
    

}

